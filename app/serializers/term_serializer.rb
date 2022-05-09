class TermSerializer
  include JSONAPI::Serializer

  attributes(:value)

  belongs_to :facet
  belongs_to :parent, serializer: TermSerializer
  has_many :children, serializer: TermSerializer
end
