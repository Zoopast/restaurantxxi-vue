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

    expense = Expense.create! amount: calculate_total, description: "Stock pedido a proveedor"
    items.each do |item|
      i = Item.find(item[:id])
      i.increment(:stock, item[:stock].to_i).save
      ExpenseItem.create!(name: i[:name], price: i[:price], quantity: item[:stock], expense_id: expense.id)
    end
    redirect_to '/expenses/' + expense.id.to_s
  end

  private

  def calculate_total
    items = params[:items].values
    total = 0
    items.each do |item|
      total += item[:price].to_i * item[:stock].to_i
    end

    total
  end

  def item_params
    params.require(:item).permit(:name, :price, :stock, :kitchen_id, :inventory_id)
  end
end
