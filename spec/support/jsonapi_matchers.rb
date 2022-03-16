module JsonApiMatchers
  def jsonapi_for(expected_obj)
    JsonApiObjectMatcher.new(expected_obj)
  end

  def contain_jsonapi_for(expected_obj)
    jsonapi_for(expected_obj)
  end

  class JsonApiObjectMatcher
    include RSpec::Matchers::Composable

    INDENT = '  '.freeze

    attr_reader :actual, :expected_obj, :expected_hash

    def initialize(expected_obj)
      @expected_hash = expected_hash_for(expected_obj)

      @expected_obj = expected_obj
    end

    def matches?(actual)
      @actual = actual
      failure_message.nil?
    end

    def failure_message
      return if (details = failure_details).empty?

      ["Expected #{description}, got #{actual.inspect}", *details].join("\n  ")
    end

    def description
      "JSON API for #{expected_hash}"
    end

    # TODO: make this work
    def diffable
      true
    end

    def expected
      expected_hash
    end

    private

    def hash_like?(v)
      %i[keys key? \[\]].all? { |m| v.respond_to?(m) }
    end

    def failure_details
      @failure_details ||= hash_diff_details(expected_hash, actual)
    end

    def expected_hash_for(expected_obj)
      return validation_error_hash(expected_obj) if expected_obj.is_a?(ActiveModel::Error)
      return activerecord_model_hash(expected_obj) if expected_obj.is_a?(ActiveRecord::Base)

      raise ArgumentError, "Don't know how to match JSONAPI for #{expected_obj}"
    end

    def validation_error_hash(validation_error)
      { 'code' => validation_error.type.to_s, 'source' => { 'pointer' => "/data/attributes/#{validation_error.attribute}" } }
    end

    def activerecord_model_hash(model)
      {
        'id' => model.id.to_s,
        'type' => model.class.name.underscore,
        'attributes' => model.attributes.except('id').transform_values(&:as_json)
      }
    end

    def hash_diff_details(h_expected, h_actual)
      return ["Not a hash: #{h_actual.inspect}"] unless hash_like?(h_actual)

      h_expected.each_with_object([]) do |(k, v_expected), details|
        details.concat(details_for_entry(k, v_expected, h_actual))
      end
    end

    def details_for_entry(k, v_expected, h_actual)
      [].tap do |details|
        next if (v_actual = h_actual[k]) == v_expected
        next (details << msg_key_not_found(k, v_expected)) unless h_actual.key?(k)
        next (details << msg_wrong_value(k, v_expected, v_actual)) unless hash_like?(v_expected)
        next if (hash_diffs = hash_diff_details(v_expected, v_actual)).empty?

        details << "#{k.inspect} hash contained unexpected values:"
        details.concat(hash_diffs.map { |diff| diff.sub(/^/, INDENT) })
      end
    end

    def msg_expected_kv(k, v_expected)
      "#{k.inspect} => expected #{v_expected.inspect}"
    end

    def msg_wrong_value(k, v_expected, v_actual)
      msg_expected_kv(k, v_expected) + ", was #{v_actual.inspect}"
    end

    def msg_key_not_found(k, v_expected)
      "#{msg_expected_kv(k, v_expected)}, but key was not found"
    end

  end
end
