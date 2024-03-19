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
end
