class Movieshow < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  belongs_to :screen
  has_many :bookings, dependent: :destroy
end
