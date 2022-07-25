require_relative 'space'

class ToyRobot
  include Space

  attr_reader :position

  def initialize(table)
    @position = table
  end

  def rotate(direction)
    rotated_vector = if direction == :left
                      { x: position.vector_y, y: - position.vector_x }
                    elsif direction == :right
                      { x: - position.vector_y, y: position.vector_x }
                    end

    position.facing = Space::UNIT_VECTOR.key(rotated_vector)

    position
  end

  def move
    position.x = position.x + position.vector_x
    position.y = position.y + position.vector_y

    position
  rescue
    nil
  end
end