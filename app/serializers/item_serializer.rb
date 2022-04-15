class ItemSerializer
  include JSONAPI::Serializer

  attributes(*Item::DATA_ATTRS)

  has_many :terms
end
