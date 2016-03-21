class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.text :description
      t.text :cartodb_url
      t.text :cartodb_sql_url
      t.boolean :is_main
      t.timestamps null: false
    end
  end
end
