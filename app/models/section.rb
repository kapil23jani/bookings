class Section < ApplicationRecord

  belongs_to :screen
  
  validates :section_name, presence: true
  validates :seats, numericality: true
  validates_uniqueness_of :section_name, scope: :screen_id
end
