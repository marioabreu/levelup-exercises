require_relative 'base_dinosaur'

class African < BaseDinosaur

  attr_accessor :name, :period, :continent, :diet, :weight, :walking, :descrition


  def initilize(name="", period="", diet="", weight="", walking="")
    super
  end

  def show_dino
    puts "Name: " + @name
    puts "Period: " + @period
    puts "Continent: " + @continent
    puts "Diet: " + @diet
    puts "Weight: " + @weight
    puts "Walking: " + @walking
    puts "Description: " + @description
  end

end