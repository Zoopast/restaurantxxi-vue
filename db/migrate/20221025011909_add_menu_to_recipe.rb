class AddMenuToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :menu, null: false, foreign_key: true
  end
end
