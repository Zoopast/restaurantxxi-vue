class AddLastVistedToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :last_visited, :datetime
  end
end
