require_relative 'toy_robot'
require_relative 'table'

class CLI
  attr_reader :status, :input

  COMMANDS = %w(PLACE LEFT RIGHT MOVE REPORT)
  FACING = %w(NORTH SOUTH EAST WEST)

  def initialize(input)
    @status = :ready_to_start
    @input = input
  end

  def start
    @input.each do |input_line|
      @command, @raw_args = input_line.split
      handle_execution
      break if done?
    end
  end

  private

  attr_reader :raw_args

  def handle_execution
    return unless COMMANDS.include?(@command)
    send("perform_#{@command.downcase}".to_sym)
  end

  def perform_place
    return unless prepare_place_args

    x, y, facing = prepare_place_args
    
    table = ::Table.new
    table.x = x
    table.y = y
    table.facing = facing

    @toy_robot = ToyRobot.new(table)
    @status = :initialized if @toy_robot
  rescue
    nil
  end

  def prepare_place_args
    array_of_args = raw_args.split(',')
    return unless array_of_args.length == 3
    return unless FACING.include?(array_of_args.last)

    x, y = array_of_args[0..1].map { |arg| Integer(arg) }
    direction = array_of_args.last.downcase.to_sym

    [x, y, direction]
  rescue
    nil
  end

  def perform_left
    @toy_robot.rotate(:left) if initialized?
  end

  def perform_right
    @toy_robot.rotate(:right) if initialized?
  end

  def perform_move
    @toy_robot.move if initialized?
  end

  def perform_report
    return unless initialized?

    position = @toy_robot.position

    puts "#{position.x},#{position.y},#{position.facing.to_s.upcase}"
    @status = :done
  end

  def initialized?
    @status == :initialized
  end

  def done?
    @status == :done
  end
end