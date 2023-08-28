# spec/models/yacht_spec.rb
require 'rails_helper'

RSpec.describe Yacht, type: :model do
  it "is valid with valid attributes" do
    user = User.create(email: 'user@example.com', password: 'password') # Create a user
    yacht = Yacht.new(
      model: "Example Yacht",
      captain_name: "Captain John",
      price: 1000,
      user: user
    )
    yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')), filename: 'sample.jpeg', content_type: 'image/jpeg')

    expect(yacht).to be_valid
  end

  it "is not valid without a model" do
    user = User.create(email: 'user@example.com', password: 'password') # Create a user
    yacht = Yacht.new(
      model: nil,
      captain_name: "Captain John",
      price: 1000,
      user: user
    )
    yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')), filename: 'sample.jpeg', content_type: 'image/jpeg')

    expect(yacht).to_not be_valid
  end

  # Add more test cases as needed
end
