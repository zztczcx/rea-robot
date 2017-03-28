require 'spec_helper'

describe ReaRobot::Commander do
  let(:commander) { ReaRobot::Commander.new }

  context 'process command string' do
    it 'parse PLACE 0, 0, NORTH' do
      expect(commander.process('PLACE 0, 0, NORTH')).to eq([:place, 0, 0, 'NORTH'])
    end

    it 'get invalid command' do
      expect(commander.process('go to 0, 0')).to eq([:invalid, 'go to 0, 0'])
    end
  end

  context 'send_command' do
    it 'will send command to robot' do
      expect(commander.instance_variable_get(:@robot)).to receive(:left)
      commander.send_command([:left])
    end
  end

  context 'load_commands' do
    it 'will read commands from File' do
      @filename = 'command.txt'
      @content = ["LEFT\n"]
      allow(File).to receive(:readlines).with(@filename).and_return(@content)

      expect(commander.instance_variable_get(:@robot)).to receive(:left)
      commander.load_commands(@filename)
    end
  end
end
