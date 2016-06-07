require 'pry'

get '/' do
  erb :main
end

post '/' do
  @board = Board.new(params)
  erb :solve
end
