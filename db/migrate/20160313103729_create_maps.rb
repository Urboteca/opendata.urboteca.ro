class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.text :cartodb_url
      t.boolean :is_main
      t.timestamps null: false
    end
  end
end
