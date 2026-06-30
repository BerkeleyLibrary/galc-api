require 'simplecov-rcov'

SimpleCov.load_profile 'rails'
SimpleCov.skip %w[/bin/ /db/]
SimpleCov.coverage_dir 'artifacts'
SimpleCov.formatter SimpleCov::Formatter::RcovFormatter
SimpleCov.minimum_coverage 100
