class RemoveEmailFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :email, :string
  end
end
