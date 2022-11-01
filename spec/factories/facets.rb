FactoryBot.define do
  multiple_allowed = %w[Genre Medium]

  factory :facet do
    name { 'Concept' }
    ord { -1 }

    to_create do |instance|
      instance.id = Facet.find_or_create_by(
        name: instance.name,
        ord: instance.ord,
        allow_multiple: multiple_allowed.include?(instance.name)
      ).id
      instance.reload
    end

    %w[Size Decade Genre Medium Appearance].each_with_index do |facet_name, index|
      multiple = multiple_allowed.include?(facet_name)
      factory_name = "facet_#{facet_name.downcase}".to_sym
      factory(factory_name) do
        name { facet_name }
        ord { index }
        allow_multiple { multiple }
      end
    end
  end
end
