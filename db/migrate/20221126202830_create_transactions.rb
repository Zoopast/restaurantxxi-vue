class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.datetime :date,            null: false, default: DateTime.now
      t.integer :transaction_type, null: false
      t.timestamps
    end
  end
end
