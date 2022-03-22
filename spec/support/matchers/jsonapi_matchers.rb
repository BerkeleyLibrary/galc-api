require_relative 'hash_diff_matcher'

module BerkeleyLibrary
  module Matchers

    def contain_jsonapi_for(expected_obj)
      return JsonApiErrorMatcher.new(expected_obj) if expected_obj.is_a?(ActiveModel::Error)
      return JsonApiModelMatcher.new(expected_obj) if expected_obj.is_a?(ActiveRecord::Base)

      raise ArgumentError, "Don't know how to match JSONAPI for #{expected_obj}"
    end

    def jsonapi_for(expected_obj)
      contain_jsonapi_for(expected_obj)
    end

    class JsonApiMatcherBase < HashDiffMatcher
      attr_reader :expected_obj

      def initialize(expected_obj, strict: true)
        expected_hash = expected_hash_for(expected_obj)
        @expected_obj = expected_obj
        super(expected_hash, strict: strict)
      end

      protected

      def failure_message_base
        "Expected JSON:API representation of #{expected_obj}, got #{actual.inspect}: "
      end
    end

    class JsonApiModelMatcher < JsonApiMatcherBase
      def expected_hash_for(expected_obj)
        raise ArgumentError, "Not an #{ActiveRecord::Base}: #{expected_obj.inspect}" unless model_like?(expected_obj)

        {
          'id' => expected_obj.id.to_s,
          'type' => expected_obj.class.name.underscore,
          'attributes' => expected_obj.attributes.except('id').transform_values(&:as_json)
        }
      end

      def model_like?(expected_model)
        %i[id attributes].all? { |attr| expected_model.respond_to?(attr) }
      end
    end

    class JsonApiErrorMatcher < JsonApiMatcherBase

      attr_reader :expected_error

      def initialize(expected_obj)
        super(expected_obj, strict: false)
      end

      def expected_hash_for(expected_error)
        raise ArgumentError, "Not an #{ActiveModel::Error}: #{expected_error.inspect}" unless validation_error_like?(expected_error)

        {
          'code' => expected_error.type.to_s,
          'source' => { 'pointer' => "/data/attributes/#{expected_error.attribute}" }
        }
      end

      def validation_error_like?(expected_error)
        %i[type attribute].all? { |attr| expected_error.respond_to?(attr) }
      end
    end
  end
end
