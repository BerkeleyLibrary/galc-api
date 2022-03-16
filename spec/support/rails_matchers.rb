# TODO: find a way not to repeat the entire comparison just to generate the failure message
RSpec::Matchers.define(:be_jsonapi_for) do |expected|
  match do |actual|
    BerkeleyLibrary::Matchers.jsonapi_matcher_for(expected, actual).matches?
  end

  failure_message do |actual|
    BerkeleyLibrary::Matchers.jsonapi_matcher_for(expected, actual).failure_message
  end
end
RSpec::Matchers.alias_matcher(:jsonapi_for, :be_jsonapi_for)

# TODO: just implement RSpec::Matchers::MatcherProtocol?
module BerkeleyLibrary
  module Matchers

    class << self
      def jsonapi_matcher_for(expected, actual)
        return JsonApiResourceMatcher.new(expected, actual) if expected.is_a?(ActiveRecord::Base)
        return JsonApiErrorMatcher.new(expected, actual) if expected.is_a?(ActiveModel::Error)
      end
    end

    module MatchHelpers
      def hash_like?(v)
        %i[keys key? \[\]].all? { |m| v.respond_to?(m) }
      end

      def missing_keys
        @missing_keys ||= expected_keys - actual.keys
      end
    end

    class JsonApiErrorMatcher
      include MatchHelpers

      attr_reader :expected
      attr_reader :actual

      def initialize(expected, actual)
        @expected = expected
        @actual = actual
      end

      def matches?
        hash_like?(actual) &&
          missing_keys.empty? &&
          wrong_values.empty?
      end

      def failure_message
        msg = ["Expected JSON:API error representing #{expected}, got #{actual.inspect}"]
        if hash_like?(actual)
          msg << "Missing keys: #{missing_keys.join(', ')}" if missing_keys.any?
          if wrong_values.any?
            msg << 'Wrong values:'
            wrong_values.each { |wv| msg << wv.to_s.gsub(/^/, '  ') }
          end
        end
        msg.join("\n  ")
      end

      private

      def wrong_values
        [].tap do |wv|
          wv << WrongValue.new('code', expected_code, actual_code) unless codes_match? || missing_keys.include?('code')
          wv << WrongValue.new('source', { 'pointer' => expected_pointer }, actual_source) unless sources_match? || missing_keys.include?('source')
        end
      end

      def sources_match?
        hash_like?(actual_source) && actual_source['pointer'] == expected_pointer
      end

      def expected_pointer
        "/data/attributes/#{expected.attribute}"
      end

      def actual_source
        actual['source']
      end

      def codes_match?
        actual_code == expected_code
      end

      def actual_code
        actual['code']
      end

      def expected_code
        expected.type.to_s
      end

      def expected_keys
        %w[code source]
      end
    end

    class JsonApiResourceMatcher
      include MatchHelpers

      attr_reader :expected
      attr_reader :actual

      def initialize(expected, actual)
        @expected = expected
        @actual = actual
      end

      def matches?
        hash_like?(actual) && missing_keys.empty? && wrong_values.empty? && attr_matcher.matches?
      end

      def failure_message
        msg = ["Expected JSON:API response representing #{expected}, got #{actual.inspect}"]
        if hash_like?(actual)
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

      def expected_keys
        %w[id type attributes]
      end

      def wrong_values
        @wrong_values ||= begin
          expected_hash = {
            'id' => (@expected_id = expected.id.to_s),
            'type' => (@expected_type = expected.class.name.underscore)
          }
          WrongValue.all(expected_hash, actual)
        end
      end

      def attr_matcher
        @attr_matcher ||= ContainsAttributesOf.new(expected, actual['attributes'], except: :id)
      end
    end

    class ContainsAttributesOf
      include MatchHelpers
      attr_reader :expected, :actual, :only, :except

      def initialize(expected, actual, only: nil, except: nil)
        @expected = expected
        @actual = actual
        @only = as_key_array(only)
        @except = as_key_array(except)
      end

      def matches?
        hash_like?(actual) && [missing_keys, unexpected_keys, wrong_values].all?(&:empty?)
      end

      def failure_message
        msg_base = "Expected JSON hash containing attributes of #{expected}, got #{actual.inspect}"
        return msg_base if (details = failure_details).empty?

        [msg_base, *details].join("\n  ")
      end

      def failure_details
        [].tap do |msg|
          if hash_like?(actual)
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

      def expected_hash
        @expected_hash ||= begin
          attrs = expected.attributes
          attrs = attrs.slice(*only) if only
          attrs = attrs.except(*except) if except
          attrs.transform_values(&:as_json)
        end
      end

      def expected_keys
        expected_hash.keys
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
