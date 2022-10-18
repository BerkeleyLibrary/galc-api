class ClosuresController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Fetching
  include JSONAPI::Filtering

  FILTER_PARAMS = %i[past current future].freeze

  before_action :set_closure, only: %i[show update destroy]
  before_action :require_galc_admin!, only: %i[create update destroy]

  # GET /closures
  def index
    render jsonapi: filtered_closures
  end

  # GET /closures/1
  def show
    render jsonapi: @closure
  end

  # POST /closures
  def create
    @closure = Closure.create!(closure_params)

    render jsonapi: @closure, status: :created, location: @closure
  end

  # PATCH/PUT /closures/1
  def update
    @closure.update!(closure_params)
    render jsonapi: @closure
  end

  # DELETE /closures/1
  def destroy
    @closure.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_closure
    @closure = Closure.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def closure_params
    @closure_params ||= jsonapi_deserialize(params, only: Closure::EDIT_ATTRS)
  end

  # @return ActionController::Parameters the filter parameters, if present
  def filter_params
    @filter_params ||= params.fetch(:filter, {}).permit!
  end

  def limit_param
    @limit ||= begin
      limit_val = params[:limit]
      ActiveRecord::Type::Integer.new.cast(limit_val)
    end
  end

  def filtered_closures
    filtered = Closure.filter_by(filters)
    limit_param ? filtered.limit(limit_param) : filtered
  end

  def filters
    @filters ||= Closure::FILTER_PARAMS.each_with_object({}) do |param, filters|
      next if (v = filter_params[param]).nil?

      filters[param] = ActiveRecord::Type::Boolean.new.cast(v)
    end
  end
end
