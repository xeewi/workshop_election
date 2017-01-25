class AdminTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :admins
  	add_column :admins, :username, :string
  	add_column :admins, :password, :string
  	add_column :users, :password, :string
  end
end
