# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a user
user = User.create!(
  email: 'van@gmail.com',
  password: '123456'
)

# Create a yacht with an attached image
yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain John',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')), filename: 'sample.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'
