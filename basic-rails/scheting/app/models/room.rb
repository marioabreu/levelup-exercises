class Room < ActiveRecord::Base
  has_many :meetings

  validates :name, presence: true

  def occupied?(begin_date, end_date)
    all_meetings_in_range = meetings.between_dates(begin_date, end_date)

    filtered_meetings = if block_given?
      yield all_meetings_in_range
    else
      all_meetings_in_range
    end

    filtered_meetings.count != 0
  end
end