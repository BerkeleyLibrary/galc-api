# Be sure to restart your server when you modify this file.

ActiveSupport::Inflector.inflections(:en) do |inflect|
  %w[JWT MMS].each { |a| inflect.acronym(a) }
end
