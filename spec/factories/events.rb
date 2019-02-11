FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(10) }
    duration { 75 }
    title { Faker::Lorem.sentence(2) }
    description { Faker::Lorem.characters(50) }
    price { Faker::Number.number(2) }
    location { Faker::Address.city }
    admin { FactoryBot.create(:user) }    
  end
end
