class Theatre < ApplicationRecord
  belongs_to :user
  has_many :screens, dependent: :destroy

  validates :name, presence: true
end
