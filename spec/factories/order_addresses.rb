FactoryBot.define do
  factory :order_address do
    token         { ENV["PAYJP_SECRET_KEY"] }
    postal_code   { "123-4567" }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city          { Faker::Address.city }
    address       { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone         { Faker::Number.number(digits: 11) }
  end
end
