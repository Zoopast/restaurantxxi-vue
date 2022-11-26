class InventoriesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    Inventory.create!
    redirect_to root_path
  end
end