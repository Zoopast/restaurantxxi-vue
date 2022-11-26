class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @reservations = Reservation.where(client_id: params[:client_id])
    render json: @reservations
  end

  def show
    products = @reservation&.order&.products&.map do |product|
      # find recipe on product
      recipe = Recipe.find(product.recipe_id)
    end
    data = { reservation: @reservation, order: @reservation.order, products: products}
    render json: data
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: api_v1_reservations_url(@reservation)
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      if params[:reservation][:status] == 'finished'
        transaction = Transaction.new transaction_type: 'income', date: Time.now
        if transaction.save
          bill = Bill.new amount: @reservation.order.total, client_id: @reservation.client_id, transaction_id: transaction.id
          if bill.save
            render json: @reservation
          else
            render json: bill.errors, status: :unprocessable_entity
          end
        else
          render json: transaction.errors, status: :unprocessable_entity
        end
      else
        render json: @reservation
      end
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end
  private

  def reservation_params
    params.require(:reservation)
          .permit(:reservation_datetime, :status, :client_id, :number_of_people)
          .merge(table_id: find_table(params[:reservation][:number_of_people]))
  end

  def find_table(number_of_people)
    Table.where("seats >= ?", number_of_people).first.id
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
