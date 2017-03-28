module ReaRobot
  class Table
    def initialize(width, length)
      @width = width
      @length = length
    end

    def valid_position?(x, y)
      (0...@width) === x && (0...@length) === y
    end
  end
end

