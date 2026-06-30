require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance and memory savings (ignored by Rake tasks).
  # config.eager_load = true
  config.eager_load = false

  # Full error reports are disabled.
  config.consider_all_requests_local = false

  # Disable serving static files from the `/public` folder by default since
  # we don't have any, except public.html which is served by AuthController#index
  config.public_file_server.enabled = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Change to "debug" to log everything (including potentially personally-identifiable information!).
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Replace the default in-process memory cache store with a durable alternative.
  # config.cache_store = :mem_cache_store

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Only use :id for inspections in production.
  config.active_record.attributes_for_inspect = [:id]

  # ------------------------------------------------------------
  # Mailer configuration

  # TODO: figure out a way to test this

  mail_smtp_username = ENV['MAIL_USERNAME'] || 'lib-noreply@berkeley.edu'
  mail_smtp_password = ENV['MAIL_PASSWORD']

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_caching = false

  smtp_settings = {
    address: 'smtp.gmail.com',
    port: '465',
    domain: 'berkeley.edu',
    user_name: mail_smtp_username,
    password: mail_smtp_password,
    authentication: 'plain',
    tls: true
  }
  config.action_mailer.smtp_settings = smtp_settings
  config.after_initialize do
    settings_cleaned = smtp_settings.merge(password: mail_smtp_password&.gsub(/./, '*'))
    Rails.logger.info('SMTP configured', smtp_settings: settings_cleaned.inspect)
  end

  if ENV['INTERCEPT_EMAILS'].present?
    require Rails.root.join('app/mailers/interceptor/mailing_list_interceptor')

    # Route emails to a mailing list in staging
    interceptor = Interceptor::MailingListInterceptor.new
    ActionMailer::Base.register_interceptor(interceptor)
    config.after_initialize do
      Rails.logger.info("Intercepting email and routing to #{interceptor.mailing_list.inspect}")
    end
  end
end
