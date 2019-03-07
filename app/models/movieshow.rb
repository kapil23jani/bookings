class Movieshow < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  belongs_to :screen
end
