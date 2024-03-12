class UpdateAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
    add_column :users, :longitude, :integer
    add_column :users, :latitude, :integer

    remove_column :users, :location, :string
    
  end
end
