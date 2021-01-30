class Ingredient < ApplicationRecord
  has_many  :doses
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
