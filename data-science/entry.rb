class Entry
  attr_reader :date, :cohort, :result

  def initialize(date: '', cohort: '', result: '')
    @date = date
    @cohort = cohort
    @result = result
  end

  def converted?
    result == 1
  end
end

