class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @ingredients = @recipe.ingredients
    recipe = {
      recipe: @recipe,
      ingredients: @ingredients
    }
    render json: recipe
  end

  def update_recipe
    @recipe = current_recipe
    if @recipe.update(recipe_params)
      edit_ingredients
      redirect_to recipes_path
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
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

  def edit_ingredients
    ingredients = params[:ingredients].values
    current_ingredients = current_recipe.ingredients.collect {  |i| i.id }

    ingredients.each do |ingredient|
      if ingredient[:id].present? && current_ingredients.include?(ingredient[:id])
        @ingredient = Ingredient.find(ingredient[:id])
        @ingredient.update!({ name: ingredient[:name], qty: ingredient[:quantity], unit: ingredient[:unit] })
      else

        binding.pry

        Ingredient.find(ingredient[:id]).destroy!
      end
    end
  end

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

  def current_recipe
    @recipe ||= Recipe.find(params[:recipe][:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation, :menu_id, :kitchen_id)
  end
end
