class ImagesValidator < ActiveModel::Validator
  MAXIMUM = 5.megabytes.freeze

  def validate(record)
    if record.images
      record.images.each do |image|
        if image.file.size > MAXIMUM
          record.errors.add(:images, I18n.t('placement.errors.images_size', max: MAXIMUM.to_s(:human_size)))
        end
      end
    end
  end
end
