class Food < ApplicationRecord
  belongs_to :restaurant
  # belongs_to :user
  has_many :orders
  has_one_attached :photo
end
