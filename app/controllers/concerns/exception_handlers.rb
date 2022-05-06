require 'jsonapi_extensions'

module ExceptionHandlers
  extend ActiveSupport::Concern

  # ------------------------------------------------------------
  # Error handler registration
  #
  # NOTE: JSONAPI::Errors registers the following handlers:
  #
  # - StandardError -> render_jsonapi_internal_server_error
  # - ActiveRecord::RecordNotFound -> render_jsonapi_not_found
  # - ActionController::ParameterMissing -> render_jsonapi_unprocessable_entity

  # rubocop:disable Metrics/BlockLength
  included do
    include JSONAPI::Errors

    rescue_from Error::NotFoundError, with: :render_jsonapi_not_found
    rescue_from Error::UnauthorizedError, with: :render_jsonapi_unauthorized_error
    rescue_from Error::ForbiddenError, with: :render_jsonapi_forbidden_error
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_errors_as_unprocessable_entity

    # ------------------------------------------------------------
    # Error handlers

    def render_jsonapi_forbidden_error(exception)
      logger.error(exception)
      render_jsonapi_error(:forbidden)
    end

    # TODO: figure out auth/auth flow
    def render_jsonapi_unauthorized_error(exception)
      logger.error(exception)
      render_jsonapi_error(:unauthorized)
    end

    def render_validation_errors_as_unprocessable_entity(exception)
      logger.error(exception)
      errors = validation_errors_from(exception) || [exception]
      render jsonapi_errors: errors, status: :unprocessable_entity
    end

    # ------------------------------------------------------------
    # Private methods

    private

    # -----------------------------
    # JSONAPI::Errors overrides

    # @see JSONAPI::Errors.render_jsonapi_internal_server_error
    def render_jsonapi_internal_server_error(exception)
      logger.error(exception)

      render_jsonapi_error(
        :internal_server_error,
        detail: exception.message,
        meta: { backtrace: exception.backtrace }
      )
    end

    # Overrides JSONAPI::Errors.render_jsonapi_not_found to include error detail
    def render_jsonapi_not_found(exception)
      logger.error(exception)

      render_jsonapi_error(:not_found, detail: exception.message)
    end

    # -----------------------------
    # Misc. utility methods

    def validation_errors_from(exception)
      return unless exception.respond_to?(:record) && (record = exception.record)
      return unless record.respond_to?(:errors) && (errors = record.errors)
      return errors if errors.is_a?(Enumerable)
    end

    def render_jsonapi_error(status, detail: nil, meta: nil)
      status_code = status_code(status)
      error = {
        status: status_code.to_s,
        title: Rack::Utils::HTTP_STATUS_CODES[status_code]
      }
      error[:detail] = detail unless detail.nil?
      error[:meta] = meta unless meta.nil?
      render(jsonapi_errors: [error], status: status_code)
    end

    def status_code(status)
      valid_integer_status_code(status) ||
        status_code_from_string(status) ||
        status_code_from_symbol(status) ||
        raise(ArgumentError, "Don't know how to convert #{status.inspect} to a numeric HTTP status")
    end

    def valid_integer_status_code(status)
      status if status.is_a?(Integer) && Rack::Utils::HTTP_STATUS_CODES.key?(status)
    end

    def status_code_from_symbol(status)
      status.is_a?(Symbol) && Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
    end

    def status_code_from_string(status)
      status.is_a?(String) && (valid_integer_status_code(status.to_i) || status_code_from_symbol(status.to_sym))
    end
  end
  # rubocop:enable Metrics/BlockLength
end
