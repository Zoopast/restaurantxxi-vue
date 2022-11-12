class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'index'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :stock, :kitchen_id, :inventory_id)
  end
end
