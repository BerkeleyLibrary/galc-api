# ------------------------------------------------------------
# Rails

ENV['RAILS_ENV'] = 'test'

# ------------------------------------------------------------
# Dependencies

require 'colorize'
require 'webmock/rspec'

require 'simplecov' if ENV['COVERAGE']

# ------------------------------------------------------------
# RSpec configuration

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

  config.around do |example|
    WebMock.disable_net_connect!(
      allow_localhost: true,
      net_http_connect_on_start: false
    )
    example.run
  ensure
    WebMock.allow_net_connect!
  end
end
