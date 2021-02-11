require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable

    def symbol
        "KN"
    end
   
    def moves_diffs
        knight_moves
    end

end