class Theatre < ApplicationRecord
	has_many :screens, dependent: :destroy
	belongs_to :user
end
