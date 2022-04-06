FactoryBot.define do
  factory :term do
    value { 'Empiricism' }

    after(:build) do |term|
      term.facet ||= (Facet.take || create(:facet))
    end
  end
end
