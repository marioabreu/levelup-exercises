require 'date'

MEETING_MAXIMUM_DURATION = 7200
MEETING_MINIMUM_DURATION = 600

class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validate :room_available
  validate :beggining_before_end
  validate :duration_limits
  validates :title, :begins, :ends, :user_id, :room_id , presence: true

  scope :between_dates, -> (begin_date, end_date) { where("(begins between ? and ?) or (ends between ? and ?)", begin_date, end_date, begin_date, end_date) }
  #scope :by_date, -> { order(:begins) }

  def self.by_date
    order(:begins)
  end

  private

  def duration_limits
    if (ends - begins) > MEETING_MAXIMUM_DURATION
      errors.add(:base, "The maximum duration for a meeting is 2 hours")
    elsif (ends - begins) < MEETING_MINIMUM_DURATION
      errors.add(:base, "The minimum duration for a meeting is 10 minutes")
    end
  end

  def beggining_before_end
    if begins > ends
      errors.add(:base, "The begin date must be before the end date")
    end
  end

  def room_available
    occupied = room.occupied?(begins, ends) { |meetings| meetings.where('id != ?', id) }

    if occupied
      errors.add(:base, "The room is occupied for that period")
    end
  end



end
