class Car < ApplicationRecord
  belongs_to :user
  validates :brand_model, presence: true
  validates :price, presence: true
end
