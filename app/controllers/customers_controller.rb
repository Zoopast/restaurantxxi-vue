class CustomersController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    client = {
      client: @client
    }
    render json: client
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to customers_path
  end

  def update_customer
    @client = Client.find(params[:id])
    if @client.update!(client_params)
      redirect_to customers_path
    else
      render json: table.errors, status: :unprocessable_entity
    end
  end


  private

  def client_params
    if params[:client][:password].present?
      params.require(:client).permit(:full_name, :email, :password, :password_confirmation)
    else
      params.require(:client).permit(:full_name, :email)
    end
  end
end