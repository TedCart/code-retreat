class Board
  attr_accessor :height, :width, :board_array
  def initialize(height, width)
    @height = height
    @width = width
    @board_array = Array.new(height * width, 0)
  end

  def coordinate_to_index(x, y)
    x + (y * width)
  end
end
