require_relative 'parses_dinosaurs'

dinosaurs = ParsesDinasours.new(['csv/dinodex.csv', 'csv/african_dinosaur_export.csv']).parse

puts dinosaurs
