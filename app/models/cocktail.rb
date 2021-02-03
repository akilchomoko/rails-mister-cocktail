class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :ingredients, through: :doses
  has_one_attached :photo

  def avg_score
    sum = 0
    reviews.each { |review| sum += review.rating }
    reviews.count.positive? ? sum / reviews.count : sum
  end
end
