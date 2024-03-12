class RemoveAddressFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :address, :string
    remove_column :users, :longitude, :integer
    remove_column :users, :latitude, :integer
  end
end
