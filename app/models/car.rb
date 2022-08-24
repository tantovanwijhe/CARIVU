class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  CATEGORIES = ["Trucks", "Vans", "Exotic & Luxury", "Convertibles", "Sport", "Classics", "Minivans", "SUVs", "Electric vehicles"]
  has_many_attached :photos
  validates :brand_model, presence: true
  validates :price, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
