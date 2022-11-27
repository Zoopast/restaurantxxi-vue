class Api::V1::MenusController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    render json: check_recipes_available
  end


  private

  def check_recipes_available
    available_recipes = []
    recipes.each do |recipe|
      available = true
      recipe.ingredients.each do |ingredient|
        next if ingredient.qty <= items.find_by(name: ingredient.name).stock

        available = false
      end

      if available
        available_recipes << recipe
      end
    end

    available_recipes
  end

  def menu
    @menu ||= Menu.find_by(default_menu: true)
  end

  def recipes
    @recipes ||= menu.recipes
  end

  def items
    @items ||= Item.all
  end

end