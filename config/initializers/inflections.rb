ActiveSupport::Inflector.inflections(:en) do |inflect|
  %w[JWT MMS].each { |a| inflect.acronym(a) }
end
