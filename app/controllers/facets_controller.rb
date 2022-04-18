class FacetsController < ApplicationController
  def index
    @facets = Facet.all
    render jsonapi: @facets, include: [:terms]
  end
end
