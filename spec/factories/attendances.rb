FactoryBot.define do
  factory :attendance do
    user { FactoryBot.create(:user) }
    event { FactoryBot.create(:event) }
  end
end
