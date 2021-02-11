require "singleton"

class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol
    end

    def symbol 
        
    end

    def empty?
        self[pos] == Nullpiece.instance
    end

    # def valid_moves
        #moving self to check?
    # end

    def pos=(val)
        #setter method for position 
        row, col = val
        @pos = val

    end

    # def move_into_check?(end_pos)

    # end
end


