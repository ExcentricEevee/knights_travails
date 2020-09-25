class Node
  attr_accessor :coordinates, :possible

  def initialize(coordinates)
    @coordinates = coordinates
    #array of coordinates containing legal next-moves from the current position on the board
    @possible = []
  end
end