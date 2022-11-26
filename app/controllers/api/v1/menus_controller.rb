class Api::V1::MenusController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @menus = Menu.find_by(default_menu: true)
    recipes = @menus.recipes
    render json: recipes
  end
end