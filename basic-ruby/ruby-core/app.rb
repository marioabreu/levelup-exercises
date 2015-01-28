require_relative 'parses_dinosaurs'
require_relative 'filters_dinosaurs'

dinosaurs = ParsesDinosaurs.new(['csv/dinodex.csv', 'csv/african_dinosaur_export.csv']).parse

puts dinosaurs

# puts dinosaurs.to_json

# puts FiltersDinosaurs.new(dinosaurs).search_by(continent: "North America", diet: "Carnivore").to_a

# puts FiltersDinosaurs.new(dinosaurs).carnivores.to_a

# puts FiltersDinosaurs.new(dinosaurs).dinosaurs_grouped_by_periods

# puts FiltersDinosaurs.new(dinosaurs).heavier_dinossaurs(10000)

#puts FiltersDinosaurs.new(dinosaurs).combine_filters(["all_pideps", "all_carnivore"])
