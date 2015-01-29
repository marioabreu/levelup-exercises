require_relative 'base_dinosaur'

class Dinosaur < BaseDinosaur
  attr_reader :diet, :continent, :description

  def initialize(name: "", period: "", continent: "", diet: "", weight_in_lbs: 0, walking: "", description: "")
    super(name: name, period: period, weight: weight_in_lbs, walking: walking)
    @diet = diet
    @continent = continent
    @description = description
  end

  def to_s
    super +
    "Diet: #{diet}\n" +
    "Continent: #{continent}\n" +
    "Description: #{description}\n\n"
  end
end
