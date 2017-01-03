class User < ApplicationRecord
  has_many :placements
  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, length: { maximum: 255 }
end
