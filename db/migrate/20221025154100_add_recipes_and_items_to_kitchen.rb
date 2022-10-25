class AddRecipesAndItemsToKitchen < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :kitchen
    add_reference :items, :kitchen
  end
end
