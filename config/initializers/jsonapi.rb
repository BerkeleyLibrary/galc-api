require 'jsonapi'

JSONAPI::Rails.install!

# Monkey-patch to get around https://github.com/stas/jsonapi.rb/issues/75 pro tem
module JSONAPI
  module Rails
    # rubocop:disable Naming/PredicateName
    class << self
      # @return [Boolean] true if it's an Enumerable that's not hash-like, false otherwise
      def is_collection?(resource, force_is_collection = nil)
        return force_is_collection unless force_is_collection.nil?

        resource.is_a?(Enumerable) && !resource.respond_to?(:each_pair)
      end
    end
    # rubocop:enable Naming/PredicateName
  end
end
