class AddRestaurantIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :restaurant, null: true, foreign_key: true
  end
end
