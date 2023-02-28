# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "Deleting User data"
# User.destroy_all

puts "Generating User data"

4.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  pseudo = "#{first_name}.#{last_name}"
  email = "#{pseudo}@gmail.com"
  password = "azerty"
  user = User.new({first_name: first_name, last_name: last_name, pseudo: pseudo, password: password, email: email})
  user.save
  puts user
end

puts "User data generated"

puts "-"*20

puts "Deleting Offer data"
Offer.destroy_all

puts "Generating User data"
2.times do
  users = User.all
  users.each do |user|
    name = "Papouilles de #{user.first_name}"
    hourly_price = rand(20..200)
    longitude = rand(-180..180)
    latitude = rand(-90..90)
    description = Faker::Quote.famous_last_words
    user_id = user.id
    offer = Offer.new({name: name, hourly_price: hourly_price, longitude: longitude, latitude: latitude, description: description, user_id: user_id})
    puts offer.valid?
    puts offer.errors.messages
    offer.save
  end
end

puts "Offer data generated"
