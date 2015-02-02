require_relative '../conversion_calculator'
require_relative '../entry'

describe ConversionCalculator do
  context '#cohort_size' do
    it 'knows the size of a cohort' do
      calculator = ConversionCalculator.new(data: [Entry.new(cohort: "B")])

      expect(calculator.cohort_size).to eq({ "B" => 1 })
    end
  end

  context '#converstions_per_cohort' do
    it 'knows the conversions number for different cohorts' do
      data = [ Entry.new(cohort: "B", result: 1), Entry.new(cohort: "A", result: 1) ]
      calculator = ConversionCalculator.new(data: data)

      expect(calculator.conversions_per_cohort).to eq({ "B" => 1, "A" => 1 })
    end

    it 'knows the conversions number for cohorts with people not converting' do
      data = [ Entry.new(cohort: "B", result: 1), Entry.new(cohort: "B", result: 0) ]
      calculator = ConversionCalculator.new(data: data)

      expect(calculator.conversions_per_cohort).to eq({ "B" => 1 })
    end
  end

  context '#conversion_rate_per_cohort' do
    it 'calculates the 95% conversion rate for a cohort' do
      data = [ Entry.new(cohort: "B", result: 1), Entry.new(cohort: "B", result: 0) ]
      calculator = ConversionCalculator.new(data: data)

      expect(calculator.conversion_rate_per_cohort["B"].percentage).to eq 50
      expect(calculator.conversion_rate_per_cohort["B"].deviation).to eq 0.69
    end
  end
end
