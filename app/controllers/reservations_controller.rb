class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    reservation = {
      reservation: @reservation
    }
    render json: reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path
    else
      render '/reservations'
    end
  end

  def update_reservation
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to reservations_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:client_id, :table_id, :reservation_datetime, :number_of_people)
  end
end
