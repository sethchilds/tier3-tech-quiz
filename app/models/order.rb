class Order < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :quantity, presence: true
  validates :total, presence: true
  validates :order_date, presence: true
end
