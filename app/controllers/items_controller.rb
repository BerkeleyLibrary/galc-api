class ItemsController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Fetching
  include JSONAPI::Pagination

  before_action :set_item, only: %i[show update destroy]
  before_action :require_galc_admin!, only: %i[create update destroy]

  # GET /items
  # GET /items?filter[<facet1>]=<term1>,<term2>…&filter[<facet2>]=…
  def index
    jsonapi_paginate(filtered_items) do |paginated|
      render jsonapi: paginated
    end
  end

  # GET /items/1
  def show
    render jsonapi: @item
  end

  # POST /items
  def create
    @item = Item.create!(item_params)
    render jsonapi: @item, status: :created, location: @item
  end

  # PATCH/PUT /items/1
  def update
    @item.update!(item_params)
    render jsonapi: @item
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    @item_params ||= jsonapi_deserialize(params, only: Item::EDIT_ATTRS)
  end

  # @return ActionController::Parameters the filter parameters, if present
  def filter_params
    @filter_params ||= params.fetch(:filter, {}).permit!
  end

  # @return Hash<String, Array<String>> the facet filter values, if present
  def facet_values
    @facet_values ||= filter_params.to_h.transform_values { |terms| terms.split(',') }
  end

  def filtered_items
    @filtered_items ||= Item.with_facet_values(facet_values).includes(:terms)
  end
end
