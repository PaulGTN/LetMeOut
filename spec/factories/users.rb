FactoryBot.define do
  factory :user do
    description { Faker::Lorem.paragraph(20) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(15) }
    
  end
end
