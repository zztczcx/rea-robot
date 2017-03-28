module ReaRobot
  class Robot
    DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze

    def initialize(table)
      @table = table
      @status = nil
    end

    def place(x, y, direction)
      return unless @table.valid_position?(x, y)
      @x = x
      @y = y
      @direction = direction
      @status = 'ready'
    end

    def next_position
      case @direction
      when 'NORTH'
        [@x, @y + 1]
      when 'EAST'
        [@x + 1, @y]
      when 'SOUTH'
        [@x, @y - 1]
      when 'WEST'
        [@x - 1, @y]
      end
    end

    def move
      return if @status.nil?

      position = next_position
      return unless @table.valid_position?(*position)
      @x, @y = position
    end

    def left
      @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
    end

    def right
      @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
    end

    def report
      puts "#{@x}, #{@y}, #{@direction}"
    end
  end
end
