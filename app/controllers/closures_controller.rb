class ClosuresController < ApplicationController
  include JSONAPI::Deserialization
  include JSONAPI::Fetching
  include JSONAPI::Filtering

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

  def limit_param
    @limit ||= begin
      limit_val = params[:limit]
      ActiveRecord::Type::Integer.new.cast(limit_val)
    end
  end

  def filter_current_param
    @filter_current ||= begin
      current_val = filter_params[:current]
      ActiveRecord::Type::Boolean.new.cast(current_val)
    end
  end

  def only_current?
    @only_current ||= filter_current_param
  end

  def exclude_current?
    @exclude_current ||= (filter_current_param == false)
  end

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

  def filtered_closures
    closures = filtered_current
    return closures unless limit_param

    closures.limit(limit_param)
  end

  def filtered_current
    return Closure.current if only_current?
    return Closure.not_current if exclude_current?

    Closure.all
  end
end
