FactoryBot.define do
  factory :user do
    description { Faker::Community.quotes }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    #event { FactoryBot.create(:event) } 
  end
end
