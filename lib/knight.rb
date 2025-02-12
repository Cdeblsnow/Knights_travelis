require "rubocop"
class Knight
  attr_accessor :board

  def initialize
    @board = []
    @moves = []
  end

  def move(start, final, position = nil)
    return puts "Invalid input" if start[0] > 7 || start[1] > 7
    return puts "Invalid input" if final[0] > 7 || final[1] > 7

    arr = [start]
    visited = [start]
    rejected = []
    while position != final
      break if arr[0].nil?

      visited << arr[1]

      position = arr[0]

      arr = arr.drop(1)
    end
    p visited
  end

  def next_vertex(start, final, rejected,  arr = [])
    if arr[0][0] + 1 <= 7 && arr[0][1] + 2 <= 7 && rejected.include?(arr[0]) == false # top_right
      arr << [arr[0][0] + 1, arr[0][1] + 2]
    elsif arr[0][0] + 2 <= 7 && arr[0][1] + 1 <= 7 && rejected.include?(arr[0]) == false # right_up
      arr << [arr[0][0] + 2, arr[0][1] + 1]
    elsif arr[0][0] + 2 <= 7 && arr[0][1] - 1 >= 0 && rejected.include?(arr[0]) == false # right_down
      arr <<  [arr[0][0] + 2, arr[0][1] - 1]
    elsif arr[0][0] + 1 <= 7 && arr[0][1] - 2 >= 0 && rejected.include?(arr[0]) == false # bottom_right
      arr <<  [arr[0][0] + 1, arr[0][1] - 2]
    elsif arr[0][0] - 1 >= 0 && arr[0][1] - 2 >= 0 && rejected.include?(arr[0]) == false # bottom_left
      arr <<  [arr[0][0] - 1, arr[0][1] - 2]
    elsif arr[0][0] - 2 >= 0 && arr[0][1] - 1 >= 0 && rejected.include?(arr[0]) == false # left_down
      arr <<  [arr[0][0] - 2, arr[0][1] - 1]
    elsif arr[0][0] - 2 >= 0 && arr[0][1] + 1 <= 7 && rejected.include?(arr[0]) == false # left_up
      arr <<  [arr[0][0] - 2, arr[0][1] + 1]
    elsif arr[0][0] - 1 >= 0 && arr[0][1] + 2 <= 7 && rejected.include?(arr[0]) == false # top_left
      arr <<  [arr[0][0] - 1, arr[0][1] + 2]
    end
    arr
  end
end
