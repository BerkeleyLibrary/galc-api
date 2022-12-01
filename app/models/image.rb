require 'marcel'
require 'zaru'
require 'image_processing/vips'
require 'active_storage'

class Image < ApplicationRecord
  THUMBNAIL_WIDTH = 360
  JPEG_EXT = '.jpg'.freeze

  delegate :url_helpers, to: 'Rails.application.routes'

  has_many :items, dependent: :nullify

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
      jpeg_file = jpeg_tempfile_from(uploaded_file)
      begin
        stem = stem_from(uploaded_file.original_filename)

        open_unique_image_file(stem, JPEG_EXT) do |file|
          IO.copy_stream(jpeg_file, file)
          file.path
        end
      ensure
        jpeg_file.close(true)
      end
    end

    def write_thumbnail(final_path)
      thumbnail_tmp = thumbnail_tmpfile_from(final_path)
      begin
        basename = File.basename(final_path)
        thumbnail_basename = "#{File.basename(basename, JPEG_EXT)}_#{THUMBNAIL_WIDTH}px#{JPEG_EXT}"
        File.join(images_path, thumbnail_basename).tap do |thumbnail_path|
          FileUtils.cp(thumbnail_tmp.path, thumbnail_path)
        end
      ensure
        thumbnail_tmp.close(true)
      end
    end

    def mime_type_of(uploaded_file)
      Marcel::MimeType.for(uploaded_file.path)
    end

    def jpeg_tempfile_from(uploaded_file)
      return uploaded_file if mime_type_of(uploaded_file) == 'image/jpeg'

      ImageProcessing::Vips.source(uploaded_file).convert('jpeg').call
    end

    def thumbnail_tmpfile_from(jpeg_path)
      ImageProcessing::Vips.source(jpeg_path).convert('jpeg').resize_to_limit(THUMBNAIL_WIDTH, nil).call
    end

    def stem_from(name)
      sanitized_name = Zaru.sanitize!(name)
      extname = File.extname(sanitized_name)
      File.basename(sanitized_name, extname)
    end

    def open_unique_image_file(base, ext, attempt = 0, &block)
      name = attempt > 0 ? "#{base}-#{attempt}#{ext}" : "#{base}#{ext}"
      full_path = File.join(images_path, name)
      File.open(full_path, File::WRONLY | File::CREAT | File::EXCL, &block)
    rescue Errno::EEXIST
      open_unique_image_file(base, ext, attempt + 1, &block)
    end
  end
end
