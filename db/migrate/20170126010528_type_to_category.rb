class TypeToCategory < ActiveRecord::Migration[5.0]
  def change
  	remove_column :elections, :type
  	add_column :elections, :category, :integer
  end
end
