class TermsController < ApplicationController
  include JSONAPI::Fetching

  def index
    @terms = Term.all
    render jsonapi: @terms
  end
end
