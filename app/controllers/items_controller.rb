class ItemsController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Fetching
  include JSONAPI::Pagination

  before_action :set_item, only: %i[show update destroy]
  before_action :require_galc_admin!, only: %i[create update destroy]

  # GET /items
  def index
    jsonapi_paginate(items) do |paginated|
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

  TRUSTED_PARAMS = Item::EDIT_ATTRS
  private_constant :TRUSTED_PARAMS

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    jsonapi_deserialize(params, only: TRUSTED_PARAMS)
  end

  def filter_params
    @filter_params ||= params.permit(filter: {})
  end

  def items
    items = Item.includes(:terms)
    logger.info("filter_params: #{filter_params}")
    facet_values = filter_params[:filter].to_h
    return items if facet_values.blank?

    items.with_facet_values(facet_values)
  end
end
