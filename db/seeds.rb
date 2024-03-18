# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Food.destroy_all
OrderLine.destroy_all
Order.destroy_all
Review.destroy_all
User.destroy_all
Restaurant.destroy_all

restaurant = Restaurant.new(
  name: "La Tour d'Argent",
  cuisine: "Italian",
  address: "Melbourne CBD",
  phone_no: "0000111122",
  email: "latour@gmail.com",
  rating: "3",
  pickup_start: "2024-03-12 06:25:00",
  pickup_end: "2024-03-12 07:25:00",
  password: "latour@gmail.com"
)
restaurant.save

restaurant2 = Restaurant.new(
  name: "Magic momo",
  cuisine: "Nepalese",
  address: "West Footscray",
  phone_no: "444466666",
  email: "magic@gmail.com",
  rating: "5",
  pickup_start: "2024-03-12 08:25:00",
  pickup_end: "2024-03-12 09:25:00",
  password: "magic@gmail.com"
)
restaurant2.save

restaurant3 = Restaurant.new(
  name: "Bon Bon bakery",
  cuisine: "Pasteries",
  address: "Richmond, melbourne",
  phone_no: "444466666",
  email: "bonbon@gmail.com",
  rating: "5",
  pickup_start: "2024-03-12 08:25:00",
  pickup_end: "2024-03-12 09:25:00",
  password: "bonbon@gmail.com"
)
restaurant3.save

Food.create!(
  name: 'Burger',
  price: 20.33,
  description: "Burger with beef patty",
  quantity: 20,
  restaurant: restaurant,
  published: true
)

Food.create!(
  name: 'Pasta',
  price: 25.00,
  description: "Spaghetti Bolognese",
  quantity: 10,
  restaurant: restaurant2
)

user1 = User.new(
  first_name: "manisha",
  last_name: "parajuli",
  phone_no: "000111222",
  email: "manisa@gmail.com",
  password: "manisa@gmail.com"
)
user1.save

user2 = User.new(
  first_name: "giv",
  last_name: "chutima",
  phone_no: "0009999888",
  email: "giv@gmail.com",
  password: "giv@gmail.com"
)
user2.save

user3 = User.new(
  first_name: "debbi",
  last_name: "deb",
  phone_no: "0009999888",
  email: "giv@gmail.com",
  password: "giv@gmail.com"
)
user3.save

puts "Success! ✨"
