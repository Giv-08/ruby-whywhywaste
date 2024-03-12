class RemoveFoodFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_reference :orders, :food, index: true, foreign_key: true

    remove_column :orders, :quantity, :integer
  end
end
