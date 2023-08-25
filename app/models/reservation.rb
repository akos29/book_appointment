class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :yatchs

  validates :date, presence: true
  validates :city, presence: true
end
