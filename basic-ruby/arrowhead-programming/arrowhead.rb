require_relative 'classifications'


class Arrowhead

  def self.classify(region, shape)
    if Classifications::CLASSIFICATIONS.include? region
      self.arrowhead(region, shape)
    else
      raise "Unknown region, please provide a valid region."
    end
  end


  def self.arrowhead(region, shape)
    shapes = Classifications::CLASSIFICATIONS[region]
    
    if shapes.include? shape
      puts "You have a(n) '#{shapes[shape]}' arrowhead. Probably priceless."
    else
      raise "Unknown shape value. Are you sure you know what you're talking about?"
    end
  end

end
