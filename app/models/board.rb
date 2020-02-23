class Board
  attr_accessor :squares, :indexes_of_givens

  def initialize(args={})
    @squares = []
    @indexes_of_givens = []
    args.each do |idx, value|
      @squares << value.to_i
      if value.to_i != 0
        @indexes_of_givens << idx.to_i
      end
    end
    @squares = @squares.each_slice(9).to_a
  end

  def solve
    return can_solve_from_cell(0, 0, self.squares)
  end

  def can_solve_from_cell(row, col, squares)
    if col == 9
      col = 0
      row += 1

      if row == 9
        return true
      end
    end

    if squares[row][col] != 0
      return can_solve_from_cell(row, col + 1, squares)
    end

    1.upto(9) do |guess|
      if can_place_guess(row, col, squares, guess)
        squares[row][col] = guess
        if can_solve_from_cell(row, col + 1, squares)
          return true
        end

        squares[row][col] = 0
      end
    end

    return false
  end

  def can_place_guess(row, col, squares, guess)
    9.times do |x|
      placementRow = squares[x]
      if guess == placementRow[col]
        return false
       end
    end

    9.times do |x|
      if guess == squares[row][x]
        return false
      end
    end

    verticalBoxIndex = row / 3
    horizontalBoxIndex = col / 3

    topLeftSubBoxRow = 3 * verticalBoxIndex
    topLeftSubBoxCol = 3 * horizontalBoxIndex

    3.times do |i|
      3.times do |j|
        if guess == squares[topLeftSubBoxRow + i][topLeftSubBoxCol + j]
          return false
        end
      end
    end

    return true
  end
end
