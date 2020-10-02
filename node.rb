#Used to fill in the board's squares with data, instantiated only as needed

class Node
  attr_accessor :coordinates, :possible, :parent

  def initialize(coordinates)
    @coordinates = coordinates
    #array of coordinates containing legal next-moves from the current position on the board
    @possible = []
    @parent = nil
  end
end