# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Restaurant.destroy_all
restaurant = Restaurant.new(
  name: "La Tour d'Argent",
  cuisine: "Italian",
  address: "Melbourne CBD",
  phone_no: "0000111122",
  email: "latour@gmail.com",
  rating: "3",
  # pickup_time: DateTime.today.change({ hour: 17 })
  pickup_start: "2024-03-12 06:25:00",
  pickup_end: "2024-03-12 07:25:00"
)
restaurant.save

restaurant2 = Restaurant.new(
  name: "Magic momo",
  cuisine: "Nepalese",
  address: "West Footscray",
  phone_no: "444466666",
  email: "magic@gmail.com",
  rating: "5",
  # pickup_time: DateTime.today.change({ hour: 17 })
  pickup_start: "2024-03-12 08:25:00",
  pickup_end: "2024-03-12 09:25:00"
)
restaurant2.save
