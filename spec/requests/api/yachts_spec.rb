require 'swagger_helper'

RSpec.describe 'api/yachts', type: :request do
  path '/yachts' do
    get 'Display all yachts' do
      tags 'Yachts'
      consumes 'application/json'
      response_schema = {
        type: :array,
        items: {
          type: :object,
          properties: {
            id: { type: :integer },
            model: { type: :string },
            captain_name: { type: :string },
            price: { type: :string },
            user_id: { type: :integer },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' },
            photo: { type: :string, format: 'uri' }
          }
        },
        required: %w[model captain_name price]
      }
      parameter name: :yachts, in: :response, schema: response_schema
      response '200', 'Recieved all yachts data' do
        let(:yachts) do
          [
            {
              id: 1,
              model: 'lastest Yacht',
              captain_name: 'Captain John',
              price: '1000.0',
              user_id: 1,
              created_at: '2023-09-05T09:53:44.386Z',
              updated_at: '2023-09-05T09:53:47.686Z',
              photo: 'http://127.0.0.1:3001/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--ea17e50303868252082e57aa54535bd27c6e4457/sample1.jpeg'
            }
          ]
        end
        run_test!
      end
    end
  end
end
