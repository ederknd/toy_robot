require_relative 'space'

class RobotOutOfTableError < StandardError; end
class Table
  include Space

  attr_accessor :facing
  attr_reader :x, :y

  BORDER_X = 5
  BORDER_Y = 5
  
  def x=(x)
    if x > BORDER_X || x < 0
      raise RobotOutOfTableError
    else
      @x = x
    end
  end
  
  def y=(y)
    if y > BORDER_Y || y < 0
      raise RobotOutOfTableError
    else
      @y = y 
    end
  end

  def current_direction
    Space::UNIT_VECTOR[facing]
  end

  def vector_x
    current_direction[:x]
  end

  def vector_y
    current_direction[:y]
  end
end