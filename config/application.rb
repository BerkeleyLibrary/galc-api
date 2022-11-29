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
require 'action_mailer/railtie'
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

    # ------------------------------------------------------------
    # Session configuration
    #
    # Session management is disabled by default in API-only Rails apps,
    # but we need it for OmniAuth
    # - see https://guides.rubyonrails.org/api_app.html#using-session-middlewares
    # - see https://github.com/omniauth/omniauth#integrating-omniauth-into-your-rails-api

    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options

    # ------------------------------------------------------------
    # CAS configuration

    config.cas_host = ENV.fetch('CAS_HOST') do
      "#{Rails.env.production? ? 'auth' : 'auth-test'}.berkeley.edu"
    end

    # ------------------------------------------------------------
    # CORS configuration -- see app/lib/cors_helper.rb

    cors_hosts = [
      '.ucblib.org',
      '.lib.berkeley.edu',
      '.pantheon.berkeley.edu',
      config.cas_host
    ]
    # Allow connections from VPN (for testing)
    cors_hosts << '.vpn.berkeley.edu' if ENV['ALLOW_VPN'].present?

    config.cors_hosts = cors_hosts

    # ------------------------------------------------------------
    # Mailer configuration

    config.reserve_email_to = ENV['RESERVE_EMAIL_TO'] || 'lib-testmail@lists.berkeley.edu'
    config.reserve_email_bcc = ENV['RESERVE_EMAIL_BCC']

    config.galc_image_base_url = ENV['GALC_IMAGE_BASE_URL'] || 'https://digitalassets.lib.berkeley.edu/galc/ucb/images/'

    # ------------------------------------------------------------
    # Volume configuration

    config.galc_volume_root = ENV['GALC_VOLUME_ROOT'] || '/var/app'

    # ------------------------------------------------------------
    # Alma API client configuration

    BerkeleyLibrary::Alma::Config.default!

    # ------------------------------------------------------------
    # Build info

    config.after_initialize { BuildInfo.log! }
  end
end
