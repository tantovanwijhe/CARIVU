class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ["Trucks", "Vans", "Exotic & Luxury", "Convertibles", "Sport", "Classics", "Minivans", "SUVs", "Electric vehicles"]

  validates :brand_model, presence: true
  validates :price, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
