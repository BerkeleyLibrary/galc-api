class ApplicationController < ActionController::API
  include ExceptionHandlers

  # ------------------------------------------------------------
  # Public methods

  # ------------------------------
  # Authentication/Authorization

  # @return [Boolean] True if the current user is authenticated, false otherwise
  delegate :authenticated?, to: :current_user

  # @return [Boolean] True if the user is a GALC administrator, false otherwise.
  delegate :galc_admin?, to: :current_user

  # Require that the current user be authenticated
  #
  # @return [void]
  # @raise [Error::UnauthorizedError] If the user is not
  #   authenticated
  def authenticate!
    raise Error::UnauthorizedError, "Endpoint #{controller_name}/#{action_name} requires authentication" unless authenticated?

    yield current_user if block_given?
  end

  # Return the current user
  #
  # This always returns a user object, even if the user isn't authenticated.
  # Call {User#authenticated?} to determine if they were actually auth'd, or
  # use the shortcut {#authenticated?} to see if the current user is auth'd.
  #
  # @return [User]
  def current_user
    @current_user ||= User.from_session(session)
  end

end
