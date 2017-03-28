require 'spec_helper'

describe ReaRobot::Robot do
  let(:robot) { ReaRobot::Robot.new ReaRobot::Table.new(5, 5) }

  context 'place on the table' do
    it 'on valid position' do
      expect(robot.place(1, 1, 'NORTH')).to eql('ready')
    end

    it 'not valid' do
      expect(robot.place(6, 1, 'NORTH')).to be_nil
    end
  end

  context 'next_position' do
    it 'when the direction is NORTH' do
      robot.place(1, 1, 'NORTH')
      expect(robot.next_position).to eq [1, 2]
    end

    it 'when the direction is EAST' do
      robot.place(1, 1, 'EAST')
      expect(robot.next_position).to eq [2, 1]
    end

    it 'when the direction is SOUTH' do
      robot.place(1, 1, 'SOUTH')
      expect(robot.next_position).to eq [1, 0]
    end

    it 'when the direction is WEST' do
      robot.place(1, 1, 'WEST')
      expect(robot.next_position).to eq [0, 1]
    end
  end

  context 'move' do
    it 'to next position if possible' do
      robot.place(1, 1, 'EAST')
      expect(robot.move).to eq [2, 1]
    end

    it 'discard if not possible' do
      robot.place(0, 0, 'WEST')
      expect(robot.move).to be_nil
    end
  end

  context 'turn' do
    it 'right from NORTH' do
      robot.place(0, 0, 'NORTH')
      expect(robot.right).to eql('EAST')
    end

    it 'lest from WEST' do
      robot.place(0, 0, 'WEST')
      expect(robot.left).to eql('SOUTH')
    end
  end

  context 'report' do
    it 'print x, y, direction' do
      robot.place(0, 0, 'WEST')
      expect { robot.report }.to output("0, 0, WEST\n").to_stdout
    end
  end
end
