# ------------------------------------------------------------
# Rails

require File.expand_path('config/application', __dir__)
Rails.application.load_tasks

# ------------------------------------------------------------
# Setup

desc 'Set up DB'
task setup: %w[db:await db:setup]

# ------------------------------------------------------------
# Check (setup + coverage)

desc 'Set up, check test coverage'
task :check do
  ENV['RAILS_ENV'] = 'test'
  Rake::Task[:setup].invoke
  Rake::Task[:coverage].invoke
end

# clear rspec/rails default :spec task
Rake::Task[:default].clear if Rake::Task.task_defined?(:default)

desc 'Set up, run tests, check code style, check test coverage, check for vulnerabilities'
task default: %i[check rubocop]
