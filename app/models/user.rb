class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile_manager, dependent: :destroy
  has_many :theatres, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :casts, dependent: :destroy
end
