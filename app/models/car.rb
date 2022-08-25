class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ["Trucks", "Vans", "Exotic & Luxury", "Convertibles", "Sport", "Classics", "Minivans", "SUVs", "Electric vehicles"]

  validates :brand_model, presence: true
  validates :price, :location, :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }, presence: true
  validates :photos, presence: true
end
