class CreateExpenseItems < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
