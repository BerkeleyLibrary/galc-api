require 'rails_helper'

describe ItemSerializer do
  it 'serializes an item' do
    item = create(:item)
    expected_hash = {
      data: {
        id: item.id.to_s,
        type: :item,
        attributes: Item::JSONAPI_ATTRS.to_h { |attr| [attr, item.send(attr)] },
        relationships: {
          terms: {
            data: item.terms.map { |t| { id: t.id.to_s, type: :term } }
          },
          image: {
            data: { id: item.image.id.to_s, type: :image }
          }
        }
      }
    }

    serializer = ItemSerializer.new(item)
    actual_hash = serializer.serializable_hash

    expect(actual_hash).to deep_eq_hash(expected_hash)
  end
end
