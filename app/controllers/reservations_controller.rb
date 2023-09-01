class ReservationsController < ApplicationController
  before_action :set_yacht, :set_user, only: %i[create index]

  def index
    # @reservations = current_user.reservations.includes(:user, yacht: :user)

    @reservations = @user.reservations.includes(:user, yacht: :user)
    render json: @reservations.to_json(include: { user: {}, yacht: { include: :user } })
  end

  def create
    reservation = @yacht.reservations.build(reservation_params)
    reservation.user = current_user || @user # after the login implementation we will change this to current_user

    if reservation.save
      render json: {
        success: true,
        message: 'Reservation created successfully',
        reservation: reservation.as_json # Include the reservation details
      }, status: :created
    else
      render json: {
        success: false,
        error: reservation.errors.full_messages.join(', ')
      }, status: :unprocessable_entity
    end
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city, :user_id, :yacht_id)
  end
end
