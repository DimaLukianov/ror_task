class Placement < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploaders :images, ImageUploader

  enum currency: %i[ uah usd eur ]

  include ActiveModel::Validations
  validates_with ImagesValidator

  validates :title, :price, :formatted_address, :lat, :lng, presence: true
  validates :lat, uniqueness: { scope: :lng, message: I18n.t('placement.errors.already_exist') }
  validates :title, length: { in: 2..255 }
  validates :description, length: { maximum: 10000 }
  validates :price, numericality: { greater_than: 0 }
  validates :images, length: { minimum: 1, maximum: 12,
    message: I18n.t('placement.errors.images_count', min: 1, max: 12) }

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
