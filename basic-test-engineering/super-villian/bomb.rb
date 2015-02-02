class Bomb

  attr_reader :code, :activated

  def initialize
    @activated = false
    @code = '1234'
  end

  def change_status(code)
    if self.code == code
      @activated = true
    else
      @activated = false
    end
  end

  def set_code(code)
    @code = code
  end


end