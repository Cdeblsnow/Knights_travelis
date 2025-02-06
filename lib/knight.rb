class Knight
  attr_accessor :board

  def initialize
    @board = []
    @moves = []
    build_board
  end

  def build_board(x = 0, y = 0)
    if y >= 8
      return hash
    elsif x >= 8
      return hash
    end

    hash = { [x, y] => [] }
    hash[[x, y]].push([x, y + 1]) if y + 1 <= 7 # add top
    hash[[x, y]].push([x + 1, y]) if x + 1 <= 7 # add right
    hash[[x, y]].push([x, y - 1]) if y - 1 >= 0 # add bottom
    hash[[x, y]].push([x - 1, y]) if x - 1 >= 0 # add left
    build_board(x, y + 1)
    build_board(x + 1, y)
    @board << hash unless @board.include?(hash)
  end
end
