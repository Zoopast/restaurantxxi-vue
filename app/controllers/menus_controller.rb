class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end


  def create

    binding.pry

    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :default_menu)
  end
end