require_relative 'board'
require 'pry'

class Knight
  attr_accessor :root, :board

  def initialize(board)
    @root = nil
    @board = board
  end

  def build_tree(finish, node = @root, queue = [])

    return node if node.coordinates == finish

    pos = node.coordinates
    #up
    valid(pos[0]-2, pos[1]-1, node)
    valid(pos[0]-2, pos[1]+1, node)
    #right
    valid(pos[0]-1, pos[1]+2, node)
    valid(pos[0]+1, pos[1]+2, node)
    #down
    valid(pos[0]+2, pos[1]-1, node)
    valid(pos[0]+2, pos[1]+1, node)
    #left
    valid(pos[0]-1, pos[1]-2, node)
    valid(pos[0]+1, pos[1]-2, node)

    queue += node.possible
    build_tree(finish, queue.shift, queue)
  end

  def valid(x, y, node)
    if ((x <= 7 && x >= 0) && (y <= 7 && y >= 0)) && board.rows[x][y] == nil
      board.rows[x][y] = Node.new([x, y])
      node.possible << board.rows[x][y]
      board.rows[x][y].parent = node
    end
  end

  def level_order(finish, current = @root)
    queue = []
    result = []

    loop do
      if current.coordinates == finish
        until current == nil
          result.unshift(current.coordinates)
          current = current.parent
        end
        return result
      else
        queue += current.possible
        current = queue.shift
      end
    end
  end

  def knight_moves(start, finish)
    self.root = Node.new(start)
    build_tree(finish)
    path = level_order(finish)
    path
  end

end


board = Board.new
knight = Knight.new(board)

p knight.knight_moves([4,3], [7,7])