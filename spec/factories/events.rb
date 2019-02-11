FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(10) }
    duration { 75 }
    title { Faker::BojackHorseman.character }
    description { Faker::BojackHorseman.quote }
    price { 500 }
    location { Faker::Address.city }
    admin { FactoryBot.create(:user) }    
  end
end
