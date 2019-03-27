class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :sections, dependent: :destroy
  has_many :movieshows, dependent: :destroy

  

end
