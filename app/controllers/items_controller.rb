class ItemsController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Fetching

  before_action :set_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = Item.all

    render jsonapi: @items
  end

  # GET /items/1
  def show
    render jsonapi: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render jsonapi: @item, status: :created, location: @item
    else
      render jsonapi_errors: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render jsonapi: @item
    else
      render jsonapi_errors: @item.errors, status: :unprocessable_entity
    end
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
end
