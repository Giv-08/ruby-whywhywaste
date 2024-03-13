class UpdateOrderStatusForOrders < ActiveRecord::Migration[7.1]
  def change
    # remove existing order_status field
    remove_column :orders, :order_status, :integer
    # create status field with default of 0
    add_column :orders, :status, :integer, default: 0
  end
end
