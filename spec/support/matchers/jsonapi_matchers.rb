require_relative 'hash_diff_matcher'

module BerkeleyLibrary
  module Matchers

    def contain_jsonapi_for(expected_obj, options = {})
      matcher_class = matcher_class_for(expected_obj)
      matcher_class.new(expected_obj, options)
    end

    def jsonapi_for(expected_obj)
      contain_jsonapi_for(expected_obj)
    end

    class JsonApiMatcherBase < HashDiffMatcher
      attr_reader :expected_obj

      def initialize(expected_obj, options = {}, strict: true)
        expected_hash = expected_hash_for(expected_obj, options)
        @expected_obj = expected_obj
        super(expected_hash, strict: strict)
      end
    end

    class JsonApiModelMatcher < JsonApiMatcherBase
      def expected_hash_for(expected_obj, options = {})
        collection_like = JSONAPI::Rails.is_collection?(expected_obj)
        serializer_class = JSONAPI::Rails.serializer_class(expected_obj, collection_like)
        serializer = serializer_class.new(expected_obj, options)
        h_raw = serializer.serializable_hash
        JSON.parse(h_raw.to_json)
      end
    end

    class JsonApiErrorMatcher < JsonApiMatcherBase

      attr_reader :expected_error

      def initialize(expected_obj, options = {})
        super(expected_obj, options, strict: false)
      end

      def expected_hash_for(expected_error, _options = {})
        raise ArgumentError, "Not an #{ActiveModel::Error}: #{expected_error.inspect}" unless validation_error_like?(expected_error)

        field_type = field_type(expected_error)
        pointer = field_type ? "/data/#{field_type}s/#{expected_error.attribute}" : ''

        {
          'code' => normalized_code(expected_error),
          'source' => { 'pointer' => pointer }
        }
      end

      def validation_error_like?(expected_error)
        %i[base type attribute].all? { |attr| expected_error.respond_to?(attr) }
      end

      private

      def normalized_code(expected_error)
        expected_error.type.to_s.delete("''").parameterize.tr('-', '_')
      end

      def field_type(expected_error)
        key = expected_error.attribute
        model_serializer = JSONAPI::Rails.serializer_class(expected_error.base, false)

        attrs = model_serializer.attributes_to_serialize
        return 'attribute' if attrs&.key?(key)

        rels = model_serializer.relationships_to_serialize
        return 'relationship' if rels&.key?(key)
      end
    end

    private

    def matcher_class_for(expected_obj)
      test_val = expected_obj.respond_to?(:first) ? expected_obj.first : expected_obj
      return JsonApiErrorMatcher if test_val.is_a?(ActiveModel::Error)
      return JsonApiModelMatcher if model_like?(test_val)

      raise ArgumentError, "Don't know how to match JSONAPI for #{expected_obj}"
    end

    def model_like?(test_val)
      [ActiveModel::API, ActiveRecord::Base].any? { |t| test_val.is_a?(t) }
    end

  end
end
