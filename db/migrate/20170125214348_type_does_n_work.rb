class TypeDoesNWork < ActiveRecord::Migration[5.0]
  def change
    remove_column :elections, :type
    add_column :elections, :elections_type_id, :integer
  end
end
