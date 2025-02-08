class Knight
  attr_accessor :board

  def initialize
    @board = []
    @moves = []
    build_board
  end

  def move(start, final, position = nil)
    return puts "Invalid input" if start[0] > 7 || start[1] > 7
    return puts "Invalid input" if final[0] > 7 || final[1] > 7

    m = { moves: [] }
    while position != final
    end
  end

  def knight_lis_of_moves(x = 0, y = 0)
    if y >= 2
      return hash
    elsif x >= 2 # rubocop:disable Lint/DuplicateBranch
      return hash
    end

    hash_y = { y: [] }
    hash_y[:y].push([y + 2]) if y + 2 <= 7 # add top
    hash_y[:y].push([y - 2]) if y - 2 >= 0 # add bottom
    # each top and bottom have right and left x value
    hash_x = { x: [] }
    hash_x[:x].push(x - 1) if x - 1 >= 0 # left
    hash_x[:x].push(x + 1) if x + 1 <= 7 # right
    [x + 1,y + 2 ],[x-1,y+2],[x+1,y-2],[x-1,y-2],[x+2,y+1],[x+2,y-1],[x-2,y+1],[x-2,y-1]

    @board << hash unless @board.include?(hash)
  end
end
