require_relative 'base_dinosaur'

class AfricanDinosaur < BaseDinosaur
  attr_reader :carnivore

  def initialize(genus: "", period: "", carnivore: "", weight: 0, walking: "")
    super(name: genus, period: period, weight: weight, walking: walking)
    @carnivore = carnivore
  end

  def to_s
    super +
    "Carnivore: #{carnivore}\n\n"
  end
end
