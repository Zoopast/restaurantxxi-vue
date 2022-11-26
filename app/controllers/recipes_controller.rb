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
    current_ingredients_ids = current_recipe.ingredients.collect(&:id)
    ingredients_ids = ingredients.collect { |i| i[:id] }

    ingredients_ids.each do |id|
      ingredient_info = ingredients.find { |i| i[:id] == id }
      if id.empty?
        Ingredient.create!(name: ingredient_info[:name],
                           recipe_id: @recipe.id,
                           qty: ingredient_info[:quantity],
                           unit: ingredient_info[:unit])
      else
        ingredient = Ingredient.find(id)
        ingredient.update!(name: ingredient_info[:name],
                           qty: ingredient_info[:quantity],
                           unit: ingredient_info[:unit])
      end
    end

    current_ingredients_ids.each do |id|
      next if ingredients_ids.include?(id.to_s)

      ingredient = Ingredient.find(id)
      ingredient.destroy!
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
    @current_recipe ||= Recipe.find(params[:recipe][:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation, :menu_id, :kitchen_id, :price)
  end
end
