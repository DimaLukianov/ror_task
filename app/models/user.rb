class User < ApplicationRecord
  has_many :placements
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, length: { maximum: 255 }

  def has_placement?(placement)
    placements.find_by_id(placement.id)
  end

  def has_comment?(comment)
    comments.find_by_id(comment.id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def initial
    first_name ? first_name[0].upcase : 'U'
  end
end
