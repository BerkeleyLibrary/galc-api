FactoryBot.define do
  factory :closure do
    start_date { Date.new(2021, 2, 3) }
    end_date { Date.new(2021, 4, 5) }
    note { 'Test closure' }

    factory :closure_open do
      start_date { Date.new(2021, 6, 7) }
      end_date { nil }
      note { 'Indefinite test closure' }
    end
  end
end
