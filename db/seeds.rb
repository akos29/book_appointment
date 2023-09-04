# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a user
user = User.create!(
  name: 'Van',
  email: 'van2023@gmail.com',
  password: '123456'
)

# Create a yacht with an attached image
yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain John',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample1.jpeg')), filename: 'sample1.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'

yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain KB',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample2.jpeg')), filename: 'sample2.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'

yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain Van',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample3.jpeg')), filename: 'sample3.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'


# Create a yacht with an attached image
yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain Mahbub',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample4.jpeg')), filename: 'sample4.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'

yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain Lagurd',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')), filename: 'sample.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'

yacht = Yacht.create!(
  model: 'lastest Yacht',
  captain_name: 'Captain Xyz',
  price: 1000,
  user: user
)
  yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')), filename: 'sample.jpeg', content_type: 'image/jpeg')

puts 'Seed data created successfully.'

# # Create Users
# user1 = User.create!(name: 'Kibre', email: 'kibre@example.com', password: 'password')
# user2 = User.create!(name: 'Lagurd ', email: 'lagurd@example.com', password: 'password')
# user3 = User.create!(name: 'Mahbub ', email: 'mahbub@example.com', password: 'password')

# # Create Yachts
# yacht1 = Yacht.create(model: 'Yacht Model 1', captain_name: 'Captain Kibre', price: 1000, user: user1)
# yacht1.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample2.jpeg')), filename: 'sample2.jpeg', content_type: 'image/jpeg')
# yacht2 = Yacht.create(model: 'Yacht Model 2', captain_name: 'Captain Laguard', price: 1500, user: user2)
# yacht2.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample3.jpeg')), filename: 'sample3.jpeg', content_type: 'image/jpeg')
# yacht3 = Yacht.create(model: 'Yacht Model 2', captain_name: 'Captain Mahbub', price: 1500, user: user3)
# yacht3.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample4.jpeg')), filename: 'sample4.jpeg', content_type: 'image/jpeg')
# # Create Reservations
# Reservation.create(date: DateTime.new(2023, 9, 15), city: 'Miami', user: User.first, yacht: Yacht.first)
# Reservation.create(date: DateTime.new(2023, 10, 20), city: 'Los Angeles', user: User.first, yacht: Yacht.last)
