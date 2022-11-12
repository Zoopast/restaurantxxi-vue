class AddExpenseToExpenseItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :expense_items, :expense, null: false, foreign_key: true
  end
end
