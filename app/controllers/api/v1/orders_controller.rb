class Api::V1::OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session


  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created, location: api_v1_orders_url(@order)
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:client_id, :reservation_id, :table_id)
  end
end