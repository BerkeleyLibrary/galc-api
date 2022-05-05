class ItemSerializer
  include JSONAPI::Serializer

  attributes(*Item::JSONAPI_ATTRS)

  has_many :terms
end
