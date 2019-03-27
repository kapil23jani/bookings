class Movie < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :casts, dependent: :destroy
  has_many :movieshows, dependent: :destroy
  has_one_attached :thumbnail, dependent: :destroy
  has_many_attached :cover_pics, dependent: :destroy
  has_one_attached :trailer, dependent: :destroy
  self.inheritance_column = :_type_disabled



  validates :release_date,:thumbnail, :cover_pics, :trailer, presence: true
  validate :must_have_valid_future_date

  validates :thumbnail, presence: :true

  

  private

  def must_have_valid_future_date
    if release_date.present?
        unless release_date.is_a?(Date)
            errors.add(:release_date, "must be a valid date")
        end

        if release_date < Date.today
            errors.add(:release_date, "can't be in the past")
        end
    end
  end


end
