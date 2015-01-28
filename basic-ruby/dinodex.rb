require_relative 'base_dinosaur'

class Dinodex < BaseDinosaur

  attr_accessor :name, :period, :continent, :diet, :weight, :walking, :descrition

  def initialize(name="", period="", continent="", diet="", weight="", walking="", description="")
    super(name, period, diet, weight, walking)
    @continent = continent
    @description = description
  end

  def show_dino  
    puts "Name: " + @name 
    puts "Period: " + @period 
    puts "Continent: " + @continent 
    puts "Diet: " + @diet 
    puts "Weight_in_lbs: " + @weight_in_lbs 
    puts "Walking: " + @walking 
    puts "Description: " + @description
  end

  
end

# dino = Dinosaur.new("NAME", "PERIOD", "CONTINENT", "DIET", "WEIGHT_IN_LBS", "WALKING", "DESCRIPTION")



