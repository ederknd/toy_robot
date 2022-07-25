require 'rspec'
require_relative '../toy_robot'

RSpec.describe ToyRobot do
  let(:toy_robot) { ToyRobot.new(Position.new(0,0, :south)) }

  describe '#initialize' do
    it 'should set initial position' do

      expect(toy_robot.position.x).to eq(0)
      expect(toy_robot.position.y).to eq(0)
      expect(toy_robot.position.direction).to eq(:south)
    end
  end

  describe '#rotate' do
    context '90 degres to left' do
      it 'should not change x position' do
        expect { toy_robot.rotate(:left) }.not_to change { toy_robot.position.x }
      end
      
      it 'should not change y position' do
        expect { toy_robot.rotate(:left) }.not_to change { toy_robot.position.y }
      end

      it '90 degres to left' do
        toy_robot.rotate(:left)

        expect(toy_robot.position.direction).to eq(:east)
      end
    end

    context '90 degres to right' do
      it 'should not change x position' do
        expect { toy_robot.rotate(:right) }.not_to change { toy_robot.position.x }
      end
      
      it 'should not change y position' do
        expect { toy_robot.rotate(:right) }.not_to change { toy_robot.position.y }
      end

      it '90 degres to left' do
        toy_robot.rotate(:right)

        expect(toy_robot.position.direction).to eq(:west)
      end
    end
  end

  describe '#move' do
    it 'should change position in direction' do
      toy_robot.move

      expect(toy_robot.position.x).to be(0)
      expect(toy_robot.position.y).to be(1)
    end
  end
end