class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def index
    @menus = Menu.all
  end

  def show
    menu = {
      menu: @menu
    }
    puts menu
    render json: menu
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      render 'index'
    end
  end

  def destroy
    @menu.destroy!
    redirect_to menus_path
  end

  def update_menu
    menu = current_menu
    if menu.update!(menu_params)
      redirect_to menus_path
    else
      render json: menu.errors, status: :unprocessable_entity
    end
  end

  private

  def current_menu
    Menu.find(params[:menu][:id])
  end

  def menu_params
    if params[:menu][:default_menu].present?
      params.require(:menu).permit(:name, :description, :default_menu)
    else
      params.require(:menu).permit(:name, :description).merge(default_menu: false)
    end
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
