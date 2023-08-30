class ReservationsController < ApplicationController
  before_action :set_yacht

  def create
    reservation = @yacht.reservations.build(reservation_params)
    reservation.user = current_user

    if reservation.save
      render json: { message: 'Reservation created successfully' }, status: :created
    else
      render json: { error: reservation.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city)
  end
end
