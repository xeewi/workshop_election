class TableElections < ActiveRecord::Migration[5.0]
  def change
  	create_table :elections
  	add_column :elections, :name, :string
  	add_column :elections, :begin, :string
  	add_column :elections, :end, :string
  	add_column :elections, :type, :integer
  end
end
