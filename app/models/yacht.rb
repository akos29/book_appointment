class Yacht < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :yacht_image

  validates :model, presence: true
  validates :captain_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :yacht_image, presence: true

  def acceptable_image
    return unless yacht_image.attached?
  
    unless yacht_image.blob.byte_size <= 1.megabyte
      errors.add(:yacht_image, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(yacht_image.content_type)
      errors.add(:yacht_image, "must be a JPEG or PNG")
    end
  end
  
end
