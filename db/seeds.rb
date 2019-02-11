require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do 
  user = User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, description: Faker::Movie.quote)
end

20.times do 
  event = Event.create!(start_date: Faker::Date.forward(10), duration: 75, title: Faker::StarWars.call_sign, description: Faker::BojackHorseman.quote, price: 500, location: Faker::Address.city, user_id: User.all.ids.sample)
end

40.times do
  attendance = Attendance.create!(stripe_customer_id: Faker::Stripe.valid_card, user_id: User.all.ids.sample, event_id: Event.all.ids.sample)
end 


