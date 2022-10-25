module RecipesHelper
  def menus_for_select
    Menu.all.map(&:id)
  end

  def kitchens_for_select
    Kitchen.all.map(&:id)
  end
end
