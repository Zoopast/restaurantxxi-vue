class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def create
    binding.pry
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path
    else
      render '/reservations'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:client_id, :table_id, :reservation_datetime, :number_of_people)
  end
end