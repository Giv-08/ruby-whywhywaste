class CartController < ApplicationController
  before_action :authenticate_user!

  def cart
    @order = Order.find_or_create_by(user: current_user, status: :cart)
  end

end
