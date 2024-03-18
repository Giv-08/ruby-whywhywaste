class Notification < ApplicationRecord
  belongs_to :restaurant
  belongs_to :order
end
