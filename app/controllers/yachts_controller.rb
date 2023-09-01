class YachtsController < ApplicationController
  include RackSessionsFix
  respond_to :json

  def index

    @yachts = Yacht.all.joins(:yacht_image_attachment)
    render json: @yachts.map { |yacht|
                   yacht.as_json.merge(photo: url_for(yacht.yacht_image))
                 }
  end


  def after_create
    # Get the id of the newly created yacht.
    yacht_id = yacht.id
  
    # Do something with the yacht id.
    render json: {
      status: { code: 201, message: 'New yachts added.' },
      data: { id: yacht_id }
    }
  end

  def create
    @yacht = Yacht.new(yacht_params)
    p current_user
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
  
  def show
    @yacht = Yacht.find(params[:id])
    render json: @yacht.as_json.merge(photo: url_for(@yacht.yacht_image))
  end

  private

  def yacht_params
    params.require(:yacht).permit(:model, :captain_name, :price, :user_id, :yacht_image)
  end
end
