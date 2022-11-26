class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|

      t.references :order, null: false, foreign_key: true
      # has one recipe
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
