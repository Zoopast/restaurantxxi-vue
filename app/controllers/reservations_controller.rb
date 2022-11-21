class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @clients = Client.all
    @tables = Table.all
  end
end