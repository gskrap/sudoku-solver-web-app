class Board
  attr_accessor :squares, :original_squares

  def initialize(args={})
    @squares = []
    args.each do |idx, value|
      if value.to_i != 0
        @squares << [value.to_i]
      else
        @squares << [1,2,3,4,5,6,7,8,9]
      end
    end
    @original_squares = @squares
  end

  def solved?()
    return false unless self.squares
    self.squares.each do |possibilities|
      if possibilities == nil || possibilities.length != 1
        return false
      # elsif board.flatten.inject(0) {|sum,x| sum + x} != 405
      #   return false
      end
    end
    true
  end

  def solve()
    10.times do
      self.squares = eliminate_row()
      self.squares = flip_row_column()
      self.squares = eliminate_row()
      self.squares = flip_row_column()
      self.squares = box_unbox()
      self.squares = eliminate_row()
      self.squares = box_unbox()
    end
    self.squares
  end

  def eliminate_row()
    rows = self.squares.each_slice(9).to_a
    rows.map! do |row|
      i = 0
      until i == row.length
        x = 0
        until x == row.length
          if row[i].length > 1 && row[x].length == 1
            row[i] -= row[x]
          end
          x += 1
        end
        i += 1
      end
      row
    end
    rows.flatten(1)
  end

  def flip_row_column()
    self.squares.each_slice(9).to_a.transpose.flatten(1)
  end

  def box_unbox()
    rowed_board = self.squares.each_slice(9).to_a
    result = []
    i = 0
    until i == rowed_board.length
      result << rowed_board[i][0..2] + rowed_board[i + 1][0..2] + rowed_board[i + 2][0..2]
      result << rowed_board[i][3..5] + rowed_board[i + 1][3..5] + rowed_board[i + 2][3..5]
      result << rowed_board[i][6..8] + rowed_board[i + 1][6..8] + rowed_board[i + 2][6..8]
      i += 3
    end
    return result.flatten(1)
  end
end
