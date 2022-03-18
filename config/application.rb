# ------------------------------------------------------------
# Read Docker secrets into the environment.

require_relative '../lib/docker'
Docker::Secret.setup_environment!

# ------------------------------------------------------------
# Standard Rails initialization

require File.expand_path('boot', __dir__)

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'

# TODO: figure out why Bundler.require() doesn't pick this up
require 'berkeley_library/logging/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GalcApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # CAS configuration
    # - NOTE: overridden in production.rb
    config.cas_host = ENV.fetch('CAS_HOST') { 'auth-test.berkeley.edu' }

    config.after_initialize do
      BuildInfo.log!
    end
  end
end
