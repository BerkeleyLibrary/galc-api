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

  config.before(:example, type: :request) do
    # Simulate HTTPS to support secure cookies
    integration_session.https!
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
# Custom matchers

require 'support/matchers'

RSpec.configure do |config|
  config.include BerkeleyLibrary::Matchers
end

# ------------------------------------------------------------
# CAS shared context

require 'support/cas_contexts'
