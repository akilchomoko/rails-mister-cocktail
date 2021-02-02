class Review < ApplicationRecord
  belongs_to :cocktail
  validates :cocktail_id, presence: true
  validates :rating, presence: true
end
