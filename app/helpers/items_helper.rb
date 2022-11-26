module ItemsHelper
  def kitchens_for_select
    Kitchen.all.map { |kitchen| { label: kitchen.id, value: kitchen.id } }
  end

  def inventories_for_select
    Inventory.all.map { |inventory| { label: inventory.id, value: inventory.id } }
  end
end