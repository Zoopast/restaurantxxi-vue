class AddPriceToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :price, :integer, default: 0, null: false
  end
end
