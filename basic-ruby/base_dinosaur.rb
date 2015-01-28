require 'csv'

class BaseDinosaur

attr_accessor :name, :period, :diet, :weight, :walking  

  def initialize(name="", period="", diet="", weight="", walking="")
    @name = name
    @period = period
    @diet = diet
    @weight = weight
    @walking = walking
  end

  def read(file)
    CSV.read(file)
  end

end