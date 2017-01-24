class TableCandidatsElections < ActiveRecord::Migration[5.0]
  def change
  	create_table :candidats_elections
  	add_column :candidats_elections, :candidat_id, :integer
  	add_column :candidats_elections, :election_id, :integer
  end
end
