class ItemsController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Fetching
  include JSONAPI::Pagination

  before_action :set_item, only: %i[show update destroy]
  before_action :require_galc_admin!, only: %i[create update destroy]
  before_action :ensure_image_param!, only: %i[create]

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
    return unless items.respond_to?(:pluck)

    mms_ids = items.pluck(:mms_id)
    {}.tap do |meta|
      meta[:availability] = AvailabilityService.availability_for(mms_ids)

      # TODO: send page size
      (pagination = jsonapi_pagination_meta(items)) && (meta[:pagination] = pagination)
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

  def ensure_image_param!
    item_params.tap do |pp|
      if (image_id = pp.delete('image_id'))
        pp[:image] = Image.find(image_id)
      else
        suppressed = ActiveModel::Type::Boolean.new.cast(pp['suppressed'])
        raise ActionController::ParameterMissing.new(:image_id, pp.keys) unless suppressed
      end
    end
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
      .except(:keywords, :suppressed)
      .transform_values { |terms| terms.split(',') }
  end

  # @return true if we should only retrieve suppressed items, false if we
  #   should only retrieve unsuppressed items, nil if we should retrieve both
  def suppressed
    return @suppressed if instance_variable_defined?(:@suppressed)

    @suppressed = calc_suppressed
  end

  def filtered_items
    @filtered_items ||= begin
      items = Item.with_facet_values(facet_values)
      items = items.where(suppressed: suppressed) unless suppressed.nil?
      items = items.with_all_keywords(keywords) if keywords
      # TODO: add sorting to API
      # TODO: allow sorting by facet values
      items.order(:artist, :title, :date)
    end
  end

  # @return true if we should only retrieve suppressed items, false if we
  #   should only retrieve unsuppressed items, nil if we should retrieve both
  def calc_suppressed
    return false unless galc_admin?
    return false if (val = filter_params[:suppressed]).blank?

    vals = val.split(',').map { |v| ActiveRecord::Type::Boolean.new.cast(v) }.uniq
    vals.first if vals.size == 1 # i.e., if it doesn't include both `true` and `false`
  end
end
