class Yacht < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :yacht_image

  validates :model, presence: true
  validates :picture, presence: true
  validates :captain_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  
end
