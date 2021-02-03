class Review < ApplicationRecord
  belongs_to :cocktail
  validates :cocktail_id, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { within: (1..5), message: "Value must be 1 to 5"}
end
