require "rubocop"
class Knight
  attr_accessor :board

  def initialize
    @board = []
    @moves = []
  end

  def move(start, final, pos = nil)
    return puts "Invalid input" if start[0] > 7 || start[1] > 7
    return puts "Invalid input" if final[0] > 7 || final[1] > 7

    arr = [start]
    visited = []
    while pos != final
      break if arr[0].nil?

      arr <<  [arr[0][0] + 1, arr[0][1] + 2] if arr[0][0] + 1 <= 7 && arr[0][1] + 2 <= 7 # top_right
      arr <<  [arr[0][0] - 1, arr[0][1] + 2] if arr[0][0] - 1 >= 0 && arr[0][1] + 2 <= 7 # top_left
      arr <<  [arr[0][0] + 2, arr[0][1] + 1] if arr[0][0] + 2 <= 7 && arr[0][1] + 1 <= 7 # right_up
      arr <<  [arr[0][0] + 2, arr[0][1] - 1] if arr[0][0] + 2 <= 7 && arr[0][1] - 1 >= 0 # right_down
      arr <<  [arr[0][0] + 1, arr[0][1] - 2] if arr[0][0] + 1 <= 7 && arr[0][1] - 2 >= 0 # bottom_right
      arr <<  [arr[0][0] - 1, arr[0][1] - 2] if arr[0][0] - 1 >= 0 && arr[0][1] - 2 >= 0 # bottom_left
      arr <<  [arr[0][0] - 2, arr[0][1] + 1] if arr[0][0] - 2 >= 0 && arr[0][1] + 1 <= 7 # left_up
      arr <<  [arr[0][0] - 2, arr[0][1] - 1] if arr[0][0] - 2 >= 0 && arr[0][1] - 1 >= 0 # left_down
      pos = arr[0]
      visited << arr[0]
      arr = arr.drop(1)
    end
    p visited
  end

  def shortest_path(start, final, visited)
  end
end
