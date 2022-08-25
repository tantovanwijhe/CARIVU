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

puts "Creating 15 users..."

15.times do
  user = User.new(
    first_name: Faker::Internet.user_name,
    last_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password"
  )
  user.save!
end

puts "Finished!"
