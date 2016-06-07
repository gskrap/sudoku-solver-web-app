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
  end

  def solve
    self.squares.length.times do |i|
      next if self.squares[i] != 0
      possible_values = find_posssible_values(i)
      possible_values.each do |x|
        self.squares[i] = x
        if solve
          return true
        end
      end
      self.squares[i] = 0
      return false
    end
    return true
  end


  def find_value_row_column(i)
    result = []
    row, column = i / 9 * 9, i % 9
    9.times do |x|
      in_row = self.squares[row + x]
      result << in_row if in_row
      in_column = self.squares[x * 9 + column]
      result << in_column if in_column
    end
    result.uniq
  end

  def find_in_square(i)
    result = []
    sq_row = i / 27 * 3
    sq_column = i % 9 / 3 * 3
    3.times do |x|
      3.times do |y|
        in_sqr = self.squares[(sq_row + x) * 9 + sq_column + y]
        result << in_sqr if in_sqr
      end
    end
    result.uniq
  end

  def find_posssible_values(i)
    possible_values = (1..9).to_a
    possible_values -= find_value_row_column(i)
    possible_values -= find_in_square(i)
    return possible_values
  end

  def solved?
    self.solve
  end
end
