class Api::V1::ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def create
    @product = Product.new(product_params)
    if @product.save
      reduce_inventory
      render json: @product, status: :created, location: api_v1_product_url(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:recipe_id, :order_id)
  end

  def reduce_inventory
    @product.recipe.ingredients.each do |ingredient|
      item = Item.find_by(name: ingredient.name)
      item.stock -= ingredient.qty
      item.save
    end
  end
end