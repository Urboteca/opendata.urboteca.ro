class AddFilterColumnsToMap < ActiveRecord::Migration
  def change
    add_column :maps, :filter_one, :string
    add_column :maps, :filter_two, :string
    add_column :maps, :filter_three, :string
  end
end
