class Movie < ApplicationRecord
	has_one_attached :thumbnail
	has_many_attached :cover_pics
	has_one_attached :trailer
	has_many :casts
	self.inheritance_column = :_type_disabled
end
