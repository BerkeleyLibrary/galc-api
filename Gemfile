source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.3'

gem 'berkeley_library-alma', '~> 0.1.1'
gem 'berkeley_library-logging', '~> 0.3'
gem 'berkeley_library-util', '~> 0.2.0'
gem 'drb'
gem 'image_processing', '~> 1.12'
gem 'jsonapi.rb', '~> 2.0'
gem 'jsonapi-serializer', '~> 2.2'
gem 'jwt', '~> 2.4'
gem 'mutex_m'
gem 'omniauth', '~> 1.9', '>= 1.9.2'
gem 'omniauth-cas', '~> 2.0'
gem 'pg', '~> 1.4'
gem 'pg_search', '~> 2.3'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.2.0'
gem 'ransack', '~> 4.2'
gem 'zaru', '~> 0.3.0'

group :development, :test do
  gem 'brakeman'
  gem 'bundle-audit'
  gem 'colorize'
end

group :development do
  gem 'hashdiff', '~> 1.0.1'
  gem 'rubocop', '~> 1.26.0'
  gem 'rubocop-rails', '~> 2.13.2', require: false
  gem 'rubocop-rspec', '~> 2.4.0', require: false
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec', '~> 3.13'
  gem 'rspec_junit_formatter', '~> 0.6'
  gem 'rspec-rails', '~> 8.0'
  gem 'simplecov', '~> 0.22', require: false
  gem 'simplecov-rcov', '~> 0.3', require: false
  gem 'webmock', require: false
end
