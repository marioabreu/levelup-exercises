
class FiltersDinosaurs

  def initialize(dinosaurs)
    @dinosaurs = dinosaurs
  end

  def to_a
    @dinosaurs
  end

  def bipeds
    @dinosaurs.select! do |dinosaur|
      dinosaur.walking == "Biped"
    end
    self
  end

  def carnivores
    @dinosaurs.select! do |dinosaur|
      dinosaur.carnivore?
    end
    self
  end

  def search_by(queries)
    queries.each_pair do |attribute, expected_value|
      @dinosaurs.select! do |dinosaur|
        dinosaur.respond_to?(attribute) &&
        dinosaur.public_send(attribute) == expected_value
      end
    end
    self
  end

  def grouped_by_periods
    @dinosaurs.group_by do |dinosaur|
      dinosaur.period
    end
  end

  def heavier_dinossaurs
    @dinosaurs.select! do |dinosaur|
      dinosaur.weight.to_i > 2000
    end
    self
  end
end