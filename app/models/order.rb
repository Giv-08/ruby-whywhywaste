class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true
  has_many :order_lines, dependent: :destroy
  has_many :foods, through: :order_lines
  has_many :restaurants, -> { distinct }, through: :foods
  has_many :notifications, dependent: :destroy

  enum :status, { cart: 0, paid: 1 }

  # Callback when updated to paid, create a notification for all restaurants associated with order
  after_update :create_restaurant_notifications
  after_update :set_total_price

  def calculate_total_price
    order_lines.sum do |ol|
      ol.quantity * ol.food.price
    end
  end

  def calculate_total_price
    order_lines.sum do |ol|
      ol.quantity * ol.food.price
    end
  end

  private

  def create_restaurant_notifications
    if self.paid?
      # Get each restaurant associated with order
      # Create a notification for that restaurant with this order (self)
      self.restaurants.each do |restaurant|
        Notification.create!(
          order: self,
          restaurant: restaurant
        )
      end
    end
  rescue
    self.errors.add(:base, "Something went wrong when creating notifications for restaurant")
  end

  def set_total_price
    # Check if the status is "paid"
    if self.paid?
      # If paid, then set the total price of the order
      self.update_column(:total_price, calculate_total_price) # Doesn't re-trigger callbacks
    end
  end
end
