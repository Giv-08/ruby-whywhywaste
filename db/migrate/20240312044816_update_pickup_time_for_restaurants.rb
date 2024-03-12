class UpdatePickupTimeForRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :pickup_start, :datetime
    add_column :restaurants, :pickup_end, :datetime
    add_column :restaurants, :address, :string
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float

    remove_column :restaurants, :pickup_time, :datetime
    remove_column :restaurants, :location, :string
  end
end
