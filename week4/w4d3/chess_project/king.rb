require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable

    def symbol
        "KI"
    end
   
    def moves_diffs
        king_moves
    end

end