# ------------------------------------------------------------
# Dependencies

require 'spec_helper'

require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

# ------------------------------------------------------------
# RSpec configuration

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

# ------------------------------------------------------------
# FactoryBot

require 'support/factory_bot'

# ------------------------------------------------------------
# jsonapi-rspec matchers

require 'jsonapi/rspec'

RSpec.configure do |config|
  config.include JSONAPI::RSpec
end

# ------------------------------------------------------------
# Custom matchers

require 'support/jsonapi_matchers'

RSpec.configure do |config|
  config.include JsonApiMatchers
end
