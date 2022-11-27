class KitchensController < ApplicationController
  #ignore login
  skip_before_action :authenticate_user!

  def index
    @orders = Order.all
    @active_orders = Product.where(status: 0)
  end

  def create
    Kitchen.create!
    redirect_to root_path
  end
end
