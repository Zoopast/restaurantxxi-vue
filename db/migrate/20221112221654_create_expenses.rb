class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :amount, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
