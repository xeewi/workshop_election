class TableCandidats < ActiveRecord::Migration[5.0]
  def change
  	create_table :candidats
  	add_column :candidats, :user_id, :integer
  	add_column :candidats, :description, :text
  	add_column :candidats, :partie, :strings
  	add_column :candidats, :liste, :text
  	add_column :candidats, :programme, :text
  end
end
