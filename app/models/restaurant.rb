class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :foods, dependent: :destroy
  # has_many :orders, dependent: :destroy
end
