class FacetSerializer
  include JSONAPI::Serializer

  attributes(:name, :allow_multiple)

  has_many :terms do |facet|
    # NOTE: We don't do this with a default_scope on Term because that
    #       will break migrations written before :ord was added
    facet.terms.order(:ord, :value)
  end
end
