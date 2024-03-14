class Users::DashboardController < ApplicationController
  def dashboard
  end

  def previous_order
    @user = current_user
    @previous_orders = Order.where(user_id: @user).where.not(id: params[:current_order_id]).order(created_at: :desc)
  end
end
