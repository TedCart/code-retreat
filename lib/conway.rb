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

  def get_surrounding_cell_coordinates(x,y)
    surrounding_cells = [
      [x - 1, y - 1],
      [x, y - 1],
      [x + 1, y - 1],
      [x - 1, y],
      [x + 1, y],
      [x - 1, y + 1],
      [x, y + 1],
      [x + 1, y + 1]
    ]
  end

  def cell_is_in_bounds(x, y)
    (x >= 0) && (y >= 0) && (x < width) && (y < height)
  end

  def count_living_neighbors(x,y)
    number_of_neighbors = 0
    neighbor_cells =  get_surrounding_cell_coordinates(x,y)
    (neighbor_cells.length).times do |i|
      number_of_neighbors += 1 if board_array[coordinate_to_index(neighbor_cells[i][0], neighbor_cells[i][1])] == 1 && cell_is_in_bounds(neighbor_cells[i][0], neighbor_cells[i][1])
    end
    number_of_neighbors
  end

  def is_alive(x, y)
    number_of_neighbors = count_living_neighbors(x, y)
    if number_of_neighbors > 3
      board_array[coordinate_to_index(x, y)]
    end
  end
end
