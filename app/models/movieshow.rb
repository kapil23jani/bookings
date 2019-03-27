class Movieshow < ApplicationRecord
  belongs_to :movie
  belongs_to :theatre
  belongs_to :screen
  has_many :bookings, dependent: :destroy

  validates :show_date, presence: true
  validate :must_have_valid_future_date

  private

  def must_have_valid_future_date
    if show_date.present?
        unless show_date.is_a?(Date)
            errors.add(:show_date, "must be a valid date")
        end

        if show_date < Date.today
            errors.add(:show_date, "can't be in the past")
        end
    end
  end


end
