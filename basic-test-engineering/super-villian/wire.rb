class Wire
  
  def initialize(bomb)
    @bomb = bomb
    @activated = false    
  end

  def activated?
    activated
  end

  def wire_bomb
    activated = true
  end

  private

  attr_reader :activated
end