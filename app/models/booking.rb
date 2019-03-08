class Booking < ApplicationRecord
  belongs_to :movieshow
  belongs_to :user
end
