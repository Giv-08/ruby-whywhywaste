class Food < ApplicationRecord
  belongs_to :restaurant
  # belongs_to :user
  has_many :order_lines, dependent: :destroy
  has_one_attached :photo

  def self.published
    where(published: true)
  end
end
