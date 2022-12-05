require 'rspec'

module BerkeleyLibrary

  module Matchers

    def deep_include_hashes(expected, indifferent: false, strict: false)
      HashDiffMatcher.new(expected, indifferent: indifferent, strict: strict)
    end

    def deep_eq_hash(expected, indifferent: false, strict: true)
      HashDiffMatcher.new(expected, indifferent: indifferent, strict: strict)
    end

    class HashDiffMatcher
      include RSpec::Matchers::Composable

      INDENT = '  '.freeze

      attr_reader :expected, :indifferent, :strict, :actual

      def initialize(expected, indifferent: false, strict: true)
        raise ArgumentError, "Not a hash: #{expected}" unless hash_like?(expected)

        @expected = expected
        @indifferent = indifferent
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
        @diffs ||= Hashdiff.diff(expected_sorted, actual_sorted, hashdiff_options).tap do |dd|
          remove_indifferences!(dd) if indifferent
          remove_extras!(dd) unless strict
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

      private

      def remove_extras!(dd)
        dd.reject! { |diff| diff[0] == '+' }
      end

      def hashdiff_options
        { strict: strict, indifferent: indifferent }
      end

      def expected_sorted
        @expected_sorted ||= deep_sort(expected)
      end

      def actual_sorted
        @actual_sorted ||= deep_sort(actual)
      end

      def remove_indifferences!(diffs)
        diffs.reject! do |diff|
          sign, _, v1, v2 = diff
          sign == '~' && v1.to_s == v2.to_s
        end
      end
    end
  end
end
