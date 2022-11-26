class AddTransactionToBills < ActiveRecord::Migration[7.0]
  def change
    add_reference :bills, :transaction, null: false, foreign_key: true
  end
end
