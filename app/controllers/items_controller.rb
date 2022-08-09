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

  def jsonapi_meta(items)
    return unless items.respond_to?(:reorder)

    # DISTINCT doesn't play well with the Item.default_scope sort order
    # TODO: figure out why it wasn't distinct to begin with
    mms_ids = items.reorder(nil).pluck('DISTINCT(mms_id)')

    {}.tap do |meta|
      meta[:availability] = AvailabilityService.availability_for(mms_ids)

      # TODO: send page size
      pagination = jsonapi_pagination_meta(items)
      meta[:pagination] = pagination if pagination.present?
    end
  end

  # @see JSONAPI::Pagination#jsonapi_pagination_meta
  def jsonapi_pagination_meta(resources)
    super.tap do |pagination|
      offset, limit, = jsonapi_pagination_params
      pagination[:offset] = offset
      pagination[:limit] = limit
    end
  end

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

  def keywords
    @keywords ||= filter_params[:keywords]
  end

  # @return Hash<String, Array<String>> the facet filter values, if present
  def facet_values
    @facet_values ||= filter_params
      .to_h
      .except(:keywords)
      .transform_values { |terms| terms.split(',') }
  end

  def filtered_items
    @filtered_items ||= begin
      items = Item.with_facet_values(facet_values)
      items = items.where(suppressed: false)
      items = items.with_all_keywords(keywords) if keywords
      items.includes(:terms)
    end
  end
end
