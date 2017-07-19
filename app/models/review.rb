class Review < ApplicationRecord
  RATINGS = [
    [1, "star"],
    [2, "stars"],
    [3, "stars"],
    [4, "stars"],
    [5, "stars"]
  ]
  belongs_to :restaurant

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: RATINGS.map { |rating| rating[0] } }
  validates :body, presence: true

end
