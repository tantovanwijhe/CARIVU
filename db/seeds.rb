# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
User.destroy_all

puts "Creating 10 users..."

10.times do
  user = User.new(
    first_name: Faker::Internet.user_name,
    last_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password"
  )
  user.save!
end

puts "Creating 1 test user..."

User.new(
  first_name: "John",
  last_name: "Appleseed",
  email: "test@test.com",
  password: "password"
)
user.save!

puts "Creating 5 Faker cars..."

number = 0
5.times do
  car = Car.new(
    brand_model: Faker::Vehicle.make_and_model,
    price: rand(1..50),
    category: Car::CATEGORIES.sample,
    description: Faker::Vehicle.standard_specs.join,
    location: "28 Stadionplein, Amsterdam",
    user: User.all.sample
  )

  file = URI.open("https://source.unsplash.com/random/1280x720/?car")
  car.photos.attach(io: file, filename: "car_sample_#{number}.png", content_type: "image/png")
  car.save!
  number += 1
  puts car.id
end

puts "Finished!"
