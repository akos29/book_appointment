class YachtsController < ApplicationController
  include RackSessionsFix
  respond_to :json

  def index
    @yachts = Yacht.all
    render json: {
      status: { code: 200, message: 'Display yachts.' },
      data: @yachts
    }
  end

  def create
    @yacht = Yacht.new(yacht_params)
    puts yacht_params
    @yacht.user_id = current_user.id
    if @yacht.save
      render json: {
        status: { code: 201, message: 'New yachts added.' },
        data: @yacht
      }
    else
      render json: {
        status: { message: 'Something went wrong!' }
      }, status: :unprocessable_entity
    end
  end
end
