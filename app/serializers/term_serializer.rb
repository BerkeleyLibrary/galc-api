class TermSerializer
  include JSONAPI::Serializer

  attributes(:value)

  belongs_to :facet
  belongs_to :parent, serializer: TermSerializer
  has_many :children, serializer: TermSerializer

  class << self
    def relationships_hash(record, relationships = nil, fieldset = nil, includes_list = nil, params = nil)
      # noinspection RubyMismatchedReturnType
      super.filter_map do |rel, h|
        next if h[:data].blank?

        [rel, h]
      end.to_h
    end
  end
end
