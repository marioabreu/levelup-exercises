class Bomb
  attr_reader :activated, :activation_code, :deactivation_code

  def initialize
    reset
  end

  def activation_code=(code)
    return if code.empty?

    @activation_code = code
  end

  def deactivation_code=(code)
    return if code.empty?

    @deactivation_code = code
  end

  def reset
    @activated = false
    @activation_code = '1234'
    @deactivation_code = '0000'
  end

  def is_numeric?
    if @activation_code =~ /\A[-+]?[0-9]+\z/
      true
    else
      false
    end
  end

  def wired?
    @activated
  end

  def wire
    @activated = true
  end

  def disarm
    @activated = false
  end
end
