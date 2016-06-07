require 'pry'

get '/' do
  erb :main
end

post '/' do
  @board = Board.new(params).solve
  if @board.solved?
    erb :solved
  else
    erb :no_solution
  end
end
