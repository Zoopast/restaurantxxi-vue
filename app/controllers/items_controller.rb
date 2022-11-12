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

  def add_stock
    items = params[:items].values
    items.each do |item|
      Item.find(item[:id]).increment(:stock, item[:stock].to_i).save
    end

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :stock, :kitchen_id, :inventory_id)
  end
end
