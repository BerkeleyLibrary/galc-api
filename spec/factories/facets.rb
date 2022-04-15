FactoryBot.define do
  factory :facet do
    name { 'Concept' }

    to_create do |instance|
      instance.id = Facet.find_or_create_by(name: instance.name).id
      instance.reload
    end

    %w[Colors Size Decade Genre Medium].each do |facet_name|
      factory_name = "facet_#{facet_name.downcase}".to_sym
      factory(factory_name) do
        name { facet_name }
      end
    end
  end
end
