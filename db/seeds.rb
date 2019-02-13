require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

5.times do 
  user = User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, password: SecureRandom.urlsafe_base64)
end

10.times do 
  event = Event.create!(start_date: Faker::Date.forward(10), duration: 75, title: Faker::StarWars.call_sign, description: Faker::BojackHorseman.quote, price: 10, location: Faker::Address.city, admin_id: User.all.ids.sample)
end

30.times do
  attendance = Attendance.create!(stripe_customer_id: Faker::Stripe.valid_card, attendee_id: User.all.ids.sample, event_id: Event.all.ids.sample)
end 


