class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates :email, presence: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, length: { maximum: 255 }
end
