class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  CATEGORIES = ["Trucks", "Vans", "Exotic & Luxury", "Convertibles", "Sport", "Classics", "Minivans", "SUVs", "Electric vehicles"]
  has_many_attached :photos
  validates :brand_model, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, inclusion: { in: CATEGORIES }, presence: true
  validates :description, presence: true
  validates :photos, presence: true
end
