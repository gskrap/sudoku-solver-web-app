require 'pry'

get '/' do
  erb :main
end

post '/' do
  @board = Board.new(params)
  @board.solve
  if @board.solved?
    erb :solved
  else
    erb :no_solution
  end
end
