class TermSerializer
  include JSONAPI::Serializer

  attributes(:value)

  belongs_to :facet
end
