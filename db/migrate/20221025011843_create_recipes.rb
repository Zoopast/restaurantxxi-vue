class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name,                  null: false, default: ""
      t.text :preparation,             null: false, default: ""
      t.timestamps
    end
  end
end
