require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of reservations with user and yacht details' do
      user = User.create!(
        name: 'Van',
        email: 'van@gmail.com',
        password: '123456'
      )

      # Create a yacht with an attached image
      yacht = Yacht.create!(
        model: 'lastest Yacht',
        captain_name: 'Captain John',
        price: 1000,
        user:
      )
      yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')),
                               filename: 'sample.jpeg', content_type: 'image/jpeg')

      reservation = Reservation.create(date: DateTime.new(2023, 9, 15), city: 'Miami', user:, yacht:)

      expected_response = [
        {
          'id' => reservation.id,
          'date' => '2023-09-15T00:00:00.000Z',
          'city' => 'Miami',
          'user' => {
            'id' => user.id,
            'name' => 'Van'
          }
        }
      ]

      get :index

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end

  describe 'POST #create' do
    it 'creates a reservation' do
      user = create(:user) # Use FactoryBot or create a user with relevant attributes
      yacht = create(:yacht) # Use FactoryBot or create a yacht with relevant attributes

      sign_in(user) # Assuming you have implemented authentication and sign_in method

      post :create, params: {
        yacht_id: yacht.id,
        reservation: {
          date: Date.today,
          city: 'Sample City'
        }
      }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({
                                                'message' => 'Reservation created successfully'
                                              })

      reservation = Reservation.last
      expect(reservation.user).to eq(user)
      expect(reservation.yacht).to eq(yacht)
    end

    it 'returns error when reservation creation fails' do
      user = create(:user)
      yacht = create(:yacht)

      sign_in(user)

      post :create, params: {
        yacht_id: yacht.id,
        reservation: {
          date: nil, # Invalid date
          city: 'Sample City'
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({
                                                'error' => "Date can't be blank"
                                              })
    end
  end
end
