class TermSerializer
  include JSONAPI::Serializer

  attributes(:value)

  belongs_to :facet
  belongs_to :parent, serializer: TermSerializer, if: ->(term) { term.parent.present? }
  has_many :children, serializer: TermSerializer, if: ->(term) { term.children.exists? }
end
