FactoryBot.define do
  factory :facet do
    name { 'Concept' }
    ord { -1 }

    to_create do |instance|
      instance.id = Facet.find_or_create_by(name: instance.name, ord: instance.ord).id
      instance.reload
    end

    %w[Size Decade Genre Medium Appearance].each_with_index do |facet_name, index|
      factory_name = "facet_#{facet_name.downcase}".to_sym
      factory(factory_name) do
        name { facet_name }
        ord { index }
      end
    end
  end
end
