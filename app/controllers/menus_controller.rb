class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def index
    @menus = Menu.all
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      render :new
    end
  end

  def destroy
    @menu.destroy!
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :default_menu)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end
end
