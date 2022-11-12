class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_datetime
      t.integer :status

      t.timestamps
    end
  end
end
