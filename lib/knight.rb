require "rubocop"
class Knight
  attr_accessor :board

  def initialize
    @board = []
    @moves = []
  end

  def move(start, final)
    return puts "Invalid input" if start[0] > 7 || start[1] > 7
    return puts "Invalid input" if final[0] > 7 || final[1] > 7

    queue = [start]
    visited = []
    path = []
    while queue.include?(final) == false
      break if queue[0].nil?

      next_vertex(queue[0]).each { |coordinate| (queue << coordinate) && (visited << coordinate) }
      visited.each do |coordinate|
        path << [queue[0], coordinate]
      end
      queue = queue.drop(1)
    end
    refine_path(start, final, path)
  end

  def next_vertex(coordinates, hold = [])
    hold << [coordinates[0] + 1, coordinates[1] + 2] if coordinates[0] + 1 <= 7 && coordinates[1] + 2 <= 7 # top_right
    hold << [coordinates[0] + 2, coordinates[1] + 1] if coordinates[0] + 2 <= 7 && coordinates[1] + 1 <= 7 # right_up
    hold << [coordinates[0] + 2, coordinates[1] - 1] if coordinates[0] + 2 <= 7 && coordinates[1] - 1 >= 0 # right_down
    hold << [coordinates[0] + 1, coordinates[1] - 2] if coordinates[0] + 1 <= 7 && coordinates[1] - 2 >= 0 # bottomright
    hold << [coordinates[0] - 1, coordinates[1] - 2] if coordinates[0] - 1 >= 0 && coordinates[1] - 2 >= 0 # bottom_left
    hold << [coordinates[0] - 2, coordinates[1] - 1] if coordinates[0] - 2 >= 0 && coordinates[1] - 1 >= 0 # left_down
    hold << [coordinates[0] - 2, coordinates[1] + 1] if coordinates[0] - 2 >= 0 && coordinates[1] + 1 <= 7 # left_up
    hold << [coordinates[0] - 1, coordinates[1] + 2] if coordinates[0] - 1 >= 0 && coordinates[1] + 2 <= 7 # top_left

    hold
  end

  def refine_path(start, final, path)
    final_path = []
    final_path << path.find { |coordinate| coordinate.include?(final) }
    path -= final_path

    until final_path.flatten(1).any? { |coordinate| coordinate == start }
      final_path << path.find do |coordinate|
        coordinate.include?(final_path[0][0])
      end
    end
    final_path.flatten(1).uniq.sort.each { |coordinate| p coordinate }
  end
end
