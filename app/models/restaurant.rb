class Restaurant < ApplicationRecord

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true

  has_many :reviews
  belongs_to :user

end
