require 'rails_helper'

RSpec.describe YachtsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of yachts with its details' do
      user = User.create!(
        name: 'Van',
        email: 'van@gmail.com',
        password: '123456'
      )

      yacht = Yacht.create!(
        model: 'Luxery Yacht X1',
        captain_name: 'Captain Mahabub',
        price: 1199,
        user:
      )
      yacht.yacht_image.attach(io: File.open(Rails.root.join('spec', 'upload', 'files', 'sample.jpeg')),
                               filename: 'sample.jpeg', content_type: 'image/jpeg')

      get :index

      expect(response).to have_http_status(:ok)
      p response.body
      expect(JSON.parse(response.body).length).to eq(1)
    end
  end
end
