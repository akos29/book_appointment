class User < ApplicationRecord
  has_many :yatchs
  has_many :reservations

  validates :name, presence: true, length: { maximum: 50 }
  # email will be added while work on devise
end
