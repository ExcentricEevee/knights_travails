require_relative 'board'
require 'pry'

class Knight
  attr_accessor :root, :board

  def initialize(start, board)
    @root = Node.new(start)
    @board = board
  end

  def build_tree(finish, root = @root, queue = [])
    current = root
    return nil if current.coordinates == finish

    #please note you'll have to account for nodes already visited
    pos = root.coordinates
    #up
    move(pos[0]-2, pos[1]-1, current)
    move(pos[0]-2, pos[1]+1, current)
    #right
    move(pos[0]-1, pos[1]+2, current)
    move(pos[0]+1, pos[1]+2, current)
    #down
    move(pos[0]+2, pos[1]-1, current)
    move(pos[0]+2, pos[1]+1, current)
    #left
    move(pos[0]-1, pos[1]-2, current)
    move(pos[0]+1, pos[1]-2, current)

    build_tree(finish, , )
  end

  def move(x, y, node)
    if ((x <= 7 && x >= 0) || (y <= 7 && y >= 0))
      node.possible << board.rows[x][y]
    end
  end

  #def knight_moves(start, finish)
  #  tree = Tree.new(start)
  #end

end


board = Board.new
knight = Knight.new([3,3], board)

knight.build_tree([1,4])
