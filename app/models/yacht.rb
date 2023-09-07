class Yacht < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :yacht_image

  validates :model, presence: true
  validates :captain_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  def acceptable_image
    return unless yacht_image.attached?

    errors.add(:yacht_image, 'is too big') unless yacht_image.blob.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(yacht_image.content_type)

    errors.add(:yacht_image, 'must be a JPEG or PNG')
  end
end
