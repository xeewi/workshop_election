class TableVotes < ActiveRecord::Migration[5.0]
  def change
  	create_table :votes
  	add_column :votes, :user_id, :integer
  	add_column :votes, :candidat_election_id, :integer
  end
end
