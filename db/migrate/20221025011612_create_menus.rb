class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.boolean :default_menu , null: false, default: false
      t.timestamps
    end
  end
end
