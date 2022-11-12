class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.datetime :reserved_at
      t.integer :seats
      t.integer :table_number

      t.timestamps
    end
  end
end
