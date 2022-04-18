class FacetsController < ApplicationController
  include JSONAPI::Fetching

  def index
    @facets = Facet.all
    render jsonapi: @facets
  end
end
