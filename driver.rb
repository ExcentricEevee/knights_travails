require_relative 'board'
require_relative 'knight'
require 'pry'

#2D array of size-8 arrays, where [0,0] is top-left corner, and [7,7] is bottom-right
board = Board.new
knight = Knight.new(board)

p knight.knight_moves([0,0], [1,2])
#binding.pry
p knight.knight_moves([0,0], [3,3])
p knight.knight_moves([0,0], [7,7])
p knight.knight_moves([3,3], [0,0])
p knight.knight_moves([7,7], [3,3])

