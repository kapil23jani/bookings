class Cast < ApplicationRecord
  belongs_to :user
  has_one_attached :cast_image, dependent: :destroy
  has_and_belongs_to_many :movies
end
