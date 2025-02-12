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
    visited = []
    rejected = []
    while position != final
      break if arr[0].nil?

      current = next_vertex(arr[-1], rejected)

      if current[0] > final[0] || current[1] > final[1] # check if it is out of range
        arr.unshift(current)
        rejected << current
      else
        arr << current
      end

      visited << arr[0]
      position = arr[-1]
      break if position == final

      arr = arr.drop(1)
    end
    arr.unshift(start)
    p arr
  end

  def next_vertex(arr, rejected, hold = [])
    if arr[0] + 1 <= 7 && arr[1] + 2 <= 7 && rejected.include?([arr[0] + 1, arr[1] + 2]) == false # top_right
      hold << [arr[0] + 1, arr[1] + 2]
    elsif arr[0] + 2 <= 7 && arr[1] + 1 <= 7 && rejected.include?([arr[0] + 2, arr[1] + 1]) == false # right_up
      hold << [arr[0] + 2, arr[1] + 1]
    elsif arr[0] + 2 <= 7 && arr[1] - 1 >= 0 && rejected.include?([arr[0] + 2, arr[1] - 1]) == false # right_down
      hold <<  [arr[0] + 2, arr[1] - 1]
    elsif arr[0] + 1 <= 7 && arr[1] - 2 >= 0 && rejected.include?([arr[0] + 1, arr[1] - 2]) == false # bottom_right
      hold <<  [arr[0] + 1, arr[1] - 2]
    elsif arr[0] - 1 >= 0 && arr[1] - 2 >= 0 && rejected.include?([arr[0] - 1, arr[1] - 2]) == false # bottom_left
      hold <<  [arr[0] - 1, arr[1] - 2]
    elsif arr[0] - 2 >= 0 && arr[1] - 1 >= 0 && rejected.include?([arr[0] - 2, arr[1] - 1]) == false # left_down
      hold <<  [arr[0] - 2, arr[1] - 1]
    elsif arr[0] - 2 >= 0 && arr[1] + 1 <= 7 && rejected.include?([arr[0] - 2, arr[1] + 1]) == false # left_up
      hold <<  [arr[0] - 2, arr[1] + 1]
    elsif arr[0] - 1 >= 0 && arr[1] + 2 <= 7 && rejected.include?([arr[0] - 1, arr[1] + 2]) == false # top_left
      hold <<  [arr[0] - 1, arr[1] + 2]
    end
    hold[-1]
  end
end
