class Placement < ApplicationRecord
  belongs_to :user

  mount_uploaders :images, ImageUploader

  enum currency: %i[ uah usd eur ]

  validates :title, :price, presence: true
  validates :title, length: { in: 2..255 }
  validates :description, length: { maximum: 10000 }
  validates :price, numericality: { greater_than: 0 }

  default_scope { order(created_at: :desc) }

  def initial
    title[0].upcase
  end

  def primary_image
    images[0] if images.any?
  end

  def secondary_images
    images.length > 1 ? images[1..-1] : []
  end

  def secondary_images?
    images.length > 1
  end
end
