class TermsController < ApplicationController
  def index
    @terms = Term.all
    render jsonapi: @terms
  end
end
