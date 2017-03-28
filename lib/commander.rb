module ReaRobot
  class Commander
    def initialize
      @table = ReaRobot::Table.new(5, 5)
      @robot = ReaRobot::Robot.new(@table)
    end

    def load_commands(file_name)
      File.readlines(file_name).each do |command|
        send_command process(command.strip)
      end
    end

    def process(command_string)
      case command_string
      when /\APLACE\s*(?<x>\d+),\s*(?<y>\d+),\s*(?<direction>\w+)\Z/
        [:place, $~[:x].to_i, $~[:y].to_i, $~[:direction]]
      when /\AMOVE\Z/
        [:move]
      when /\ALEFT\Z/
        [:left]
      when /\ARIGHT\Z/
        [:right]
      when /\AREPORT\Z/
        [:report]
      else
        [:invalid, command_string]
      end
    end

    def send_command(command)
      if command[0] == :invalid
        raise "invalid #{command}"
      else
        @robot.send(command[0], *command.drop(1))
      end
    end
  end
end
