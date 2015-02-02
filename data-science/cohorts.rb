class Cohorts
  def initialize(sample: [])
    @sample = sample
  end

  def count
    sample.each_with_object(Hash.new(0)) do |entry, cohorts_count|
      cohorts_count[entry.cohort] += 1
    end
  end

  def conversions
    sample.each_with_object(Hash.new(0)) do |entry, conversions|
      if entry.converted?
        conversions[entry.cohort] += 1
      end
    end
  end

  private

  attr_reader :sample
end
