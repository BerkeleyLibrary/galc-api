class ImageSerializer
  include JSONAPI::Serializer

  attributes(*Image::JSONAPI_ATTRS)

  link :alternate do |image|
    {
      href: image.relative_uri,
      type: Image::JPEG_MIME_TYPE
    }
  end

  link :icon do |image|
    {
      href: image.thumbnail_relative_uri,
      type: Image::JPEG_MIME_TYPE
    }
  end
end
