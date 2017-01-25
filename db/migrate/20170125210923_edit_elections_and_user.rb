class EditElectionsAndUser < ActiveRecord::Migration[5.0]
  def change
  	change_column :elections_types, :name, :string
  	change_column :users, :password, :string
  end
end
