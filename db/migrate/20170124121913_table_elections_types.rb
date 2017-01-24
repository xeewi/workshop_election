class TableElectionsTypes < ActiveRecord::Migration[5.0]
  def change
  	create_table :elections_types
  	add_column :elections_types, :name, :integer
  end
end
