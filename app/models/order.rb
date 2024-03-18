class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_lines, dependent: :destroy

  enum :status, { cart: 0, paid: 1 }
end
