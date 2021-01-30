class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :ingredients, through: :doses
end
