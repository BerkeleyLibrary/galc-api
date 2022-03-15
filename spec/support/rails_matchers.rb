# TODO: find a way not to repeat the entire comparison just to generate the failure message
RSpec::Matchers.define(:be_jsonapi_for) do |expected|
  match do |actual|
    matcher = BerkeleyLibrary::Matchers::JsonApiResourceMatcher.new(expected, actual)
    matcher.matches?
  end

  failure_message do |actual|
    matcher = BerkeleyLibrary::Matchers::JsonApiResourceMatcher.new(expected, actual)
    matcher.failure_message
  end
end
RSpec::Matchers.alias_matcher(:jsonapi_for, :be_jsonapi_for)

# TODO: just implement RSpec::Matchers::MatcherProtocol?
module BerkeleyLibrary
  module Matchers
    class JsonApiResourceMatcher
      attr_reader :expected
      attr_reader :actual

      def initialize(expected, actual)
        @expected = expected
        @actual = actual
      end

      def matches?
        hash_like? && missing_keys.empty? && id_matches? && type_matches? && attr_matcher.matches?
      end

      def failure_message
        msg = ["Expected JSON:API response representing #{expected}, got #{actual.inspect}"]
        if hash_like?
          msg << "Missing keys: #{missing_keys.join(', ')}" if missing_keys.any?
          if wrong_values.any?
            msg << 'Wrong values:'
            wrong_values.each { |wv| msg << wv.to_s.gsub(/^/, '  ') }
          end
          msg << attr_matcher.failure_message.gsub(/^/, '  ') if actual.key?('attributes') && !attr_matcher.matches?
        end
        msg.join("\n  ")
      end

      private

      # TODO: DRY
      def hash_like?
        @hash_like = %i[keys key? \[\]].all? { |m| actual.respond_to?(m) }
      end

      def missing_keys
        @missing_keys ||= %w[id type attributes] - actual.keys
      end

      def id_matches?
        @id_matches = actual['id'] == expected_id
      end

      def type_matches?
        @type_matches = actual['type'] == expected_type
      end

      def wrong_values
        @wrong_values ||= WrongValue.all({ 'id' => expected_id, 'type' => expected_type }, actual)
      end

      def expected_id
        @expected_id = expected.id.to_s
      end

      def expected_type
        @expected_type = expected.class.name.underscore
      end

      def attr_matcher
        @attr_matcher ||= ContainsAttributesOf.new(expected, actual['attributes'], except: :id)
      end
    end

    class ContainsAttributesOf
      attr_reader :expected, :actual, :only, :except

      def initialize(expected, actual, only: nil, except: nil)
        @expected = expected
        @actual = actual
        @only = as_key_array(only)
        @except = as_key_array(except)
      end

      def matches?
        hash_like? && [missing_keys, unexpected_keys, wrong_values].all?(&:empty?)
      end

      def failure_message
        msg_base = "Expected JSON hash containing attributes of #{expected}, got #{actual.inspect}"
        return msg_base if (details = failure_details).empty?

        [msg_base, *details].join("\n  ")
      end

      def failure_details
        [].tap do |msg|
          if hash_like?
            msg << "Missing keys: #{missing_keys.join(', ')}" if missing_keys.any?
            msg << "Unexpected keys: #{unexpected_keys.join(', ')}" if unexpected_keys.any?
            if wrong_values.any?
              msg << 'Wrong values:'
              wrong_values.each { |wv| msg << wv.to_s.gsub(/^/, '  ') }
            end
          end
        end
      end

      private

      def as_key_array(arr)
        return if arr.nil?

        Array(arr).map(&:to_s)
      end

      # TODO: DRY
      def hash_like?
        @hash_like = %i[keys key? \[\]].all? { |m| actual.respond_to?(m) }
      end

      def expected_hash
        @expected_hash ||= begin
          attrs = expected.attributes
          attrs = attrs.slice(*only) if only
          attrs = attrs.slice(*(attrs.keys - except)) if except
          attrs.transform_values(&:as_json)
        end
      end

      def missing_keys
        @missing_keys ||= expected_hash.keys - actual.keys
      end

      def unexpected_keys
        @extra_keys ||= actual.keys - expected_hash.keys
      end

      def wrong_values
        @wrong_values ||= WrongValue.all(expected_hash, actual)
      end

    end

    class WrongValue
      attr_reader :key, :v_expected, :v_actual

      def initialize(key, v_expected, v_actual)
        @key = key
        @v_actual = v_actual
        @v_expected = v_expected
      end

      class << self
        def all(expected_hash, actual_hash)
          expected_hash.filter_map do |k, v_expected|
            next unless actual_hash.key?(k)
            next if (v_actual = actual_hash[k]) == v_expected

            WrongValue.new(k, v_expected, v_actual)
          end
        end
      end

      def to_s
        <<~STR
          #{key.inspect} =>
              expected: #{v_expected.inspect}
              actual:   #{v_actual.inspect}
        STR
      end
    end
  end
end
