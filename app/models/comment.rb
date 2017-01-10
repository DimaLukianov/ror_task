class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :placement

  mount_uploaders :images, ImageUploader

  include ActiveModel::Validations
  validates_with ImagesValidator

  validates :body, :user, presence: true
  validates :images, length: { maximum: 8,
    message: I18n.t('placement.errors.images_count', min: 0, max: 8) }
end
