class TypeToCategory < ActiveRecord::Migration[5.0]
  def change
  	add_column :elections, :category, :integer
  end
end
