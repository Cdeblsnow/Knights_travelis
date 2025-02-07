class Knight
  attr_accessor :board

  def initialize
    @board = []
    @moves = []
    build_board
  end

  def build_board(x = 0, y = 0)
    if y >= 2
      return hash
    elsif x >= 2 # rubocop:disable Lint/DuplicateBranch
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

  def move(start, final, position = nil, hash_value = nil, arr = [])
    return if position == final

    @board.each do |hash|
      hash.each do |key, value|
        position = key
        hash_value = value
        break if position == start
      end
      break if position == start
    end

    move(start, final, position, hash_value, arr)
    arr << hash_value
    move(start, final, position, hash_value, arr)
  end
end
