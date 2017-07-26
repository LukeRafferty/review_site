class Review < ApplicationRecord

  validates :rating, presence: true

  belongs_to :restaurant
  belongs_to :user
  has_many :votes

end
