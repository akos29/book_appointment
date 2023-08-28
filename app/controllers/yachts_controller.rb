class YachtsController < ApplicationController
  def index
    @yachts = Yacht.all
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.user_id = current_user.id
    if @yacht.save
      redirect_to yacht_path(@yacht)
    else
      render :new
    end
  end
end
