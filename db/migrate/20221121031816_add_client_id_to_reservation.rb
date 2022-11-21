class AddClientIdToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :client, null: false, foreign_key: true
  end
end
