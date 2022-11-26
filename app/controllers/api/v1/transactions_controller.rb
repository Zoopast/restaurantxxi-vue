class Api::V1::TransactionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @transaction = Transaction.new(transaction_params)
  end



  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount)
  end
end