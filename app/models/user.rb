class User < ApplicationRecord

  validates :username, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :admin, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
