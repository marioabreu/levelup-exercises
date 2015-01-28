class BaseDinosaur
  
  attr_reader :name, :period, :weight, :walking

  def initialize(name: "", period: "", weight: 0, walking: "")
    @name = name
    @period = period
    @weight = weight
    @walking = walking
  end

  def to_s
    "Name: #{name}\n" +
    "Period: #{period}\n" +
    "Weight: #{weight}\n" +
    "Walking: #{walking}\n"
  end
end
