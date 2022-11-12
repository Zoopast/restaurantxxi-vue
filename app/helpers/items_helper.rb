module ItemsHelper
  def kitchens_for_select
    Kitchen.all.map(&:id)
  end

  def inventories_for_select
    Inventory.all.map(&:id)
  end
end