class CreateMapTables < ActiveRecord::Migration
  def change
    create_table :map_tables do |t|
      t.text :header
      t.timestamps
    end
  end
end
