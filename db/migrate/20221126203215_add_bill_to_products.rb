class AddBillToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :bill
  end
end
