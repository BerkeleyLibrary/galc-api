class ItemSerializer
  include JSONAPI::Serializer

  attributes(*Item::DATA_ATTRS)
end
