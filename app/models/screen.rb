class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :sections
  has_many :movieshows 
end
