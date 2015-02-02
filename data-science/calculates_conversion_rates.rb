class CalculatesConversionRates
  ConversionRate = Struct.new(:percentage, :deviation)
  ERROR_MULTIPLIER = 1.96

  def initialize(number_of_trials: 0, conversions_count: 0)
    @number_of_trials = number_of_trials
    @conversions_count = conversions_count
  end

  def conversion_rate_per_cohort
    percentage = conversions_count.fdiv(number_of_trials)
    standard_error = Math.sqrt((percentage * (1 - percentage)).fdiv(number_of_trials))

    ConversionRate.new(percentage * 100, (standard_error * ERROR_MULTIPLIER).round(2))
  end

  private

  attr_reader :number_of_trials, :conversions_count
end
