class User < ApplicationRecord
  has_many :reviews
  
  validates :username, presence: true
  validates :email, presence: true, format: { with: /@/ }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    admin == true
  end

end
