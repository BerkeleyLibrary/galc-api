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
    config.load_defaults 7.0
    config.api_only = true

    # Session management is disabled by default in API-only Rails apps,
    # but we need it for OmniAuth
    # - see https://guides.rubyonrails.org/api_app.html#using-session-middlewares
    # - see https://github.com/omniauth/omniauth#integrating-omniauth-into-your-rails-api
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options

    # CAS configuration
    # - NOTE: overridden in production.rb
    config.cas_host = ENV.fetch('CAS_HOST') { 'auth-test.berkeley.edu' }

    BerkeleyLibrary::Alma::Config.default!

    config.after_initialize do
      BuildInfo.log!
    end
  end
end
