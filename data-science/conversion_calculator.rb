require_relative "cohorts"
require_relative "calculates_conversion_rates"

class ConversionCalculator
  def initialize(data: [])
    @data = data
  end

  def cohort_size
    @_cohort_size ||= Cohorts.new(sample: data).count
  end

  def conversions_per_cohort
    @_conversions_per_cohort ||= Cohorts.new(sample: data).conversions
  end

  def conversion_rate_per_cohort
    data.each_with_object({}) do |entry, conversion_rates|
      number_of_trials = cohort_size[entry.cohort]
      conversions_count = conversions_per_cohort[entry.cohort]

      conversion_rates[entry.cohort] = CalculatesConversionRates
        .new(number_of_trials: number_of_trials, conversions_count: conversions_count)
        .conversion_rate_per_cohort
    end
  end

  private

  attr_reader :data
end
