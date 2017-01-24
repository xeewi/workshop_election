class TableUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :users
  	add_column :users, :name, :string
  	add_column :users, :surname, :string
  	add_column :users, :birthdate, :string
  	add_column :users, :email, :string
  	add_column :users, :address, :string
  	add_column :users, :zipcode, :string
  	add_column :users, :city, :string
  	add_column :users, :picture, :string
  end
end
