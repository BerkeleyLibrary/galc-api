class FacetSerializer
  include JSONAPI::Serializer

  attributes(:name)

  has_many :terms
end
