class User < ApplicationRecord

  validates :username, presence: true
  validates :email, presence: true, format: { with: /@/ }

  has_many :reviews

  #CarrierWave
  mount_uploader :profile_photo, ProfilePhotoUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
