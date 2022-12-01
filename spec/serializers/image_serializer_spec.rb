require 'rails_helper'

describe ImageSerializer do

  attr_reader :image

  before do
    @image = create(:image)
  end

  it 'serializes an image' do
    serializer = ImageSerializer.new(image)

    expected_hash = {
      data: {
        id: image.id.to_s,
        type: :image,
        attributes: Image::JSONAPI_ATTRS.to_h { |attr| [attr, image.send(attr)] },
        links: {
          alternate: {
            href: image.relative_uri,
            type: Image::JPEG_MIME_TYPE
          },
          icon: {
            href: image.thumbnail_relative_uri,
            type: Image::JPEG_MIME_TYPE
          }
        }
      }
    }

    actual_hash = serializer.serializable_hash

    expect(actual_hash).to deep_eq_hash(expected_hash)
  end
end
