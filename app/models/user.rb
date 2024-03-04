class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_many :orders
  has_secure_password
  validates :username, presence: true
  validates :address, presence: true
  validates :password, presence: false
  validates :role, inclusion: { in: %w[admin user] }
end
