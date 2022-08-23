class Car < ApplicationRecord
  belongs_to :users
  validates :brand_model, presence: true
end
