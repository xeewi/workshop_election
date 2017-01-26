class AddStringToCandidatsPartieField < ActiveRecord::Migration[5.0]
  def change
    remove_column :candidats, :partie
  	add_column :candidats, :partie, :string
  end
end
