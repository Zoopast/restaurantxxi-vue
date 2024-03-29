module RecipesHelper
  def menus_for_select
    Menu.all.map { |menu| {label: menu.name, value: menu.id} }
  end

  def kitchens_for_select
    Kitchen.all.map { |kitchen| {label: kitchen.id, value: kitchen.id} }
  end

  def measurements_for_select
    Unit.all.map { |unit| {label: unit.measurement, value: unit.id} }
  end
end
