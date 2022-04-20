require 'rspec'

module BerkeleyLibrary

  module Matchers

    def deep_include_hashes(expected)
      HashDiffMatcher.new(expected, strict: false)
    end

    def deep_eq_hash(expected)
      HashDiffMatcher.new(expected)
    end

    class HashDiffMatcher
      include RSpec::Matchers::Composable

      INDENT = '  '.freeze

      attr_reader :expected, :strict, :actual

      def initialize(expected, strict: true)
        raise ArgumentError, "Not a hash: #{expected}" unless hash_like?(expected)

        @expected = expected
        @strict = strict
      end

      def matches?(actual)
        @actual = actual
        @matches = hash_like?(actual) && diffs.empty?
      end

      def failure_message
        return if matches?(actual)

        failure_message_base + failure_message_details
      end

      # def description
      #   (instance_variable_defined?(:@actual) && failure_message) || inspect
      # end
      #
      # def diffable?
      #   false
      # end

      protected

      def failure_message_base
        <<~MSG
          Expected#{' hash including' unless strict}:
            #{expected.inspect}
          Got:
            #{actual.inspect}
        MSG
      end

      def hash_like?(v)
        %i[keys key? \[\]].all? { |m| v.respond_to?(m) }
      end

      def failure_message_details
        return 'Not a hash' unless hash_like?(actual)

        ['diff:', *formatted_diffs].join("\n#{INDENT}")
      end

      def diffs
        @diffs ||= Hashdiff.diff(deep_sort(expected), deep_sort(actual)).tap do |dd|
          dd.reject! { |diff| diff[0] == '+' } unless strict
        end
      end

      def deep_sort(x)
        return deep_sort_array(x) if x.is_a?(Array)
        return deep_sort_hash(x) if x.is_a?(Hash)

        x
      end

      def deep_sort_hash(h)
        h.keys.sort_by(&:to_s).to_h do |k|
          [k, deep_sort(h[k])]
        end
      end

      def deep_sort_array(a)
        a.map { |v| deep_sort(v) }.sort_by(&:to_s)
      end

      def formatted_diffs
        [].tap do |dts|
          diffs.each do |diff|
            sign, keypath, v1, v2 = diff
            next if !strict && (sign == '+')

            if sign == '~'
              dts << "- #{keypath} => #{v1.inspect}"
              dts << "+ #{keypath} => #{v2.inspect}"
            else
              dts << "#{sign} #{keypath} => #{v1.inspect}"
            end
          end
        end
      end

    end
  end
end
