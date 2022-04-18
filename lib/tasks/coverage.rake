desc 'Run all specs in spec directory, with coverage'
task :coverage do
  raise "Can't run specs; expected RAILS_ENV=\"test\", was #{Rails.env.inspect}" unless Rails.env.test?

  ENV['COVERAGE'] ||= 'true'
  Rake::Task[:spec].invoke
end
