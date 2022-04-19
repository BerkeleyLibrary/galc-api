class FacetsController < ApplicationController
  include JSONAPI::Fetching

  def index
    # TODO: Is there a way to do this with fewer SQL queries?
    @facets = Facet.includes(terms: [:parent, :children]).all
    render jsonapi: @facets
  end
end
