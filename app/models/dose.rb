class Dose < ApplicationRecord
  belongs_to :ingredient
  validates :ingredient_id, presence: true
  belongs_to :cocktail
  validates :cocktail_id, presence: true
  validates :description, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id }
end
