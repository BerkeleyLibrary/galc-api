require 'active_storage'
require 'image_processing/vips'
require 'marcel'
require 'pathname'
require 'zaru'

class Image < ApplicationRecord
  # ------------------------------------------------------------
  # Constants

  JPEG_EXT = '.jpg'.freeze
  JPEG_MIME_TYPE = 'image/jpeg'.freeze
  THUMBNAIL_WIDTH = 360
  JSONAPI_ATTRS = %i[thumbnail basename].freeze
  MODE_NEW_FILES = File::WRONLY | File::CREAT | File::EXCL

  # ------------------------------------------------------------
  # Relations

  has_many :items, dependent: :restrict_with_exception

  # ------------------------------------------------------------
  # Validations

  validates :basename, presence: true
  validates :thumbnail, presence: true

  # ------------------------------------------------------------
  # Hooks

  after_destroy :remove_image_files

  def remove_image_files
    [file_path, thumbnail_path].each do |p|
      logger.info("Image #{id}: deleting #{p}")
      FileUtils.rm_f(p)
    end
  end

  # ------------------------------------------------------------
  # Delegate methods

  delegate :url_helpers, to: 'Rails.application.routes'

  # ------------------------------------------------------------
  # Synthetic accessors

  def relative_uri
    url_helpers.image_path(self, format: :jpg)
  end

  def thumbnail_relative_uri
    url_helpers.thumbnail_path(self, format: :jpg)
  end

  def file_path
    File.join(Image.images_path, basename)
  end

  def thumbnail_path
    File.join(Image.images_path, thumbnail)
  end

  # ------------------------------------------------------------
  # Class methods

  class << self
    # TODO: move most of this to a service

    delegate :galc_volume_root, to: 'Rails.application.config'

    def images_path
      File.join(galc_volume_root, 'images')
    end

    def from_uploaded_file(uploaded_file)
      final_path = write_jpeg_file(uploaded_file)
      thumbnail_path = write_thumbnail(final_path)
      Image.create!(
        basename: File.basename(final_path),
        thumbnail: File.basename(thumbnail_path)
      )
    end

    private

    def write_jpeg_file(uploaded_file)
      jpeg_tmp = jpeg_tempfile_from(uploaded_file)
      begin
        sanitized_name = Zaru.sanitize!(uploaded_file.original_filename)
        stem = File.basename(sanitized_name, File.extname(sanitized_name))
        save_image(stem, jpeg_tmp)
      ensure
        jpeg_tmp.close(true)
      end
    end

    def write_thumbnail(final_path)
      thumbnail_tmp = thumbnail_tmpfile_from(final_path)
      begin
        save_thumbnail(File.basename(final_path), thumbnail_tmp)
      ensure
        thumbnail_tmp.close(true)
      end
    end

    def save_image(stem, jpeg_tmp)
      open_unique_image_file(stem, JPEG_EXT) do |file|
        logger.info("Writing image to #{file.path}")
        IO.copy_stream(jpeg_tmp, file)
        file.path
      end
    end

    def save_thumbnail(basename, thumbnail_tmp)
      thumbnail_basename = "#{File.basename(basename, JPEG_EXT)}_#{THUMBNAIL_WIDTH}px#{JPEG_EXT}"
      File.join(images_path, thumbnail_basename).tap do |thumbnail_path|
        logger.info("Writing thumbnail to #{thumbnail_path}")
        FileUtils.cp(thumbnail_tmp.path, thumbnail_path)
      end
    end

    def mime_type_of(uploaded_file)
      pathname = Pathname.new(uploaded_file.path)
      Marcel::MimeType.for(pathname)
    end

    def jpeg_tempfile_from(uploaded_file)
      mime_type = mime_type_of(uploaded_file)
      return uploaded_file if (mime_type) == JPEG_MIME_TYPE

      logger.info("#{uploaded_file.path} (#{uploaded_file.original_filename}) is #{mime_type}; converting to #{JPEG_MIME_TYPE}")
      ImageProcessing::Vips.source(uploaded_file).convert('jpeg').call
    end

    def thumbnail_tmpfile_from(jpeg_path)
      logger.info("Creating thumbnail from #{jpeg_path}")
      ImageProcessing::Vips.source(jpeg_path).convert('jpeg').resize_to_limit(THUMBNAIL_WIDTH, nil).call
    end

    def open_unique_image_file(base, ext, attempt = 0, &block)
      name = attempt > 0 ? "#{base}-#{attempt}#{ext}" : "#{base}#{ext}"
      full_path = File.join(images_path, name)

      begin
        return File.open(full_path, MODE_NEW_FILES, &block) unless Image.exists?(basename: name)
      rescue Errno::EEXIST
        # fall through to next attempt
      end

      open_unique_image_file(base, ext, attempt + 1, &block)
    end
  end
end
