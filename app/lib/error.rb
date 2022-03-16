module Error
  # Base class for all errors in the application.
  class ApplicationError < StandardError; end

  # Raised when an unauthenticated request is made to a protected resource.
  #
  # This is called 'Unauthorized' (rather than the more accurate 'Not
  # Authenticated') because that is how the HTTP Spec defines this.
  #
  # @see https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401
  class UnauthorizedError < ApplicationError; end

  # Raised when an authenticated user attempts an unauthorized actions
  class ForbiddenError < ApplicationError; end
end
