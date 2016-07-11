require 'pry'

get '/' do
  erb :main
end

post '/' do
  @board = Board.new(params)
  if @board.solve && !@board.squares.include?(0)
    erb :solved
  else
    erb :no_solution
  end
end
