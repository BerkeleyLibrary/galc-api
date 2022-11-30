class Image < ApplicationRecord
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
    delegate :galc_volume_root, to: 'Rails.application.config'

    def images_path
      File.join(galc_volume_root, 'images')
    end
  end
end
