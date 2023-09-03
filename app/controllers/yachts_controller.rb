class YachtsController < ApplicationController
  include RackSessionsFix
  respond_to :json

  def index
    @yachts = Yacht.all.joins(:yacht_image_attachment)
    render json: @yachts.map { |yacht|
                   yacht.as_json.merge(photo: url_for(yacht.yacht_image))
                 }
  end

  def create
    yacht = Yacht.new(yacht_params)
    yacht.save!
    render json: {
      status: { code: 201, message: 'New yachts added.' },
      data: { id: yacht.id }
    }
    # The after_create callback will be called after the yacht has been saved.
  end

  def show
    @yacht = Yacht.find(params[:id])
    render json: @yacht.as_json.merge(photo: url_for(@yacht.yacht_image))
  end

  def destroy
    @yacht = Yacht.find(params[:id])
  end

  private

  def yacht_params
    params.require(:yacht).permit(:model, :captain_name, :price, :user_id, :yacht_image)
  end
end
