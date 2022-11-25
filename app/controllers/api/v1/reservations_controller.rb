class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = Reservation.create(reservation_params)
    render json: @reservation
  end

  private

  def reservation_params
    params.require(:reservation).permit(:client_id, :table_id, :reservation_datetime, :number_of_people, :status)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
