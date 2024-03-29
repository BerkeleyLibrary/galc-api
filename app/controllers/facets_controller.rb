class FacetsController < ApplicationController
  include JSONAPI::Fetching

  def index
    # TODO: Is there a way to do this with fewer SQL queries?
    @facets = Facet.order(:ord).includes(terms: %i[parent children]).all
    render jsonapi: @facets
  end
end
