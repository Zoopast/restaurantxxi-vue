class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      create_ingredients
      redirect_to recipes_path
    else
      render 'index'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def create_ingredients
    ingredients = params[:ingredients].values

    ingredients.each do |ingredient|
      @recipe.ingredients.create!(name: ingredient[:name],
                                  qty: ingredient[:quantity],
                                  unit: ingredient[:unit],
                                  recipe_id: @recipe.id)
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation, :menu_id, :kitchen_id)
  end
end