require 'faker'
require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
User.destroy_all

puts "Creating 5 Faker users..."

5.times do
  user = User.new(
    first_name: Faker::Internet.user_name,
    last_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password"
  )
  user.save!
end

puts "Creating 1 test user..."

test = User.new(
  first_name: "John",
  last_name: "Appleseed",
  email: "test@test.com",
  password: "password"
)

test.save!

puts "Creating 9 Faker cars..."
sample_locations = ["28 Stadionplein, Amsterdam", "108 Westlandgracht, Amsterdam",
                    "100 Kajuit, Groningen", "104 Oldenoord, Rotterdam",
                    "86 Feldmannweg, Delft", "151 Van Woustraat, Amsterdam", "83 Da Costakade, Utrecht",
                    "14 Fockema Andreaepad, Rotterdam"]
number = 0
9.times do
  car = Car.new(
    brand_model: Faker::Vehicle.make_and_model,
    price: rand(20..100),
    category: Car::CATEGORIES.sample,
    description: Faker::Vehicle.standard_specs.join(', '),
    location: sample_locations.sample,
    user: User.all.sample
  )

  file = URI.open("https://source.unsplash.com/random/1280x720/?car")
  car.photos.attach(io: file, filename: "car_sample_#{number}.png", content_type: "image/png")
  car.save!
  number += 1
  puts car.id
end

puts "Finished!"
