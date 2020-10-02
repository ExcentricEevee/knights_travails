require_relative 'node'

class Board
  attr_accessor :rows

  def initialize
    @rows = build_board
  end

  def build_board
    result = []

    #Create an array that holds 8 arrays of size-8
    8.times do
      result << Array.new(8)
    end
    rows = result
  end

end