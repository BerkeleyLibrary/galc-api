class TermSerializer
  include JSONAPI::Serializer

  attributes(:value, :ord)

  belongs_to :facet
  belongs_to :parent, serializer: TermSerializer
  has_many :children, serializer: TermSerializer

  class << self
    # @see { JSONAPI::Serializer#relationships_hash }
    # rubocop:disable Metrics/ParameterLists
    def relationships_hash(record, relationships = nil, fieldset = nil, includes_list = nil, params = nil)
      # noinspection RubyMismatchedReturnType
      super.filter_map do |rel, h|
        next if h[:data].blank?

        [rel, h]
      end.to_h
    end
    # rubocop:enable Metrics/ParameterLists
  end
end
