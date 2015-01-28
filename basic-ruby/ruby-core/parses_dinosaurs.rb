require 'csv'
require 'json'
require_relative 'dinosaur'
require_relative 'african_dinosaur'

class ParsesDinosaurs < BaseDinosaur
  def initialize(files)
    @files = files
  end


  def parse
    files.flat_map do |file|
      parse_single_file(file)
    end
  end

  def to_json
    
  end

  private

  attr_reader :files

  def parse_single_file(file)
    dinosaurs = []
    CSV.foreach(file, headers: true, header_converters: [:downcase, :symbol], skip_blanks: true) do |dinossaur_info|
      dinosaurs << create_dinosaur(dinossaur_info)
    end
    dinosaurs
  end

  def create_dinosaur(dinossaur_info)
    if dinossaur_info[:genus]
      AfricanDinosaur.new(dinossaur_info.to_hash)
    else
      Dinosaur.new(dinossaur_info.to_hash)
    end
  end
end
