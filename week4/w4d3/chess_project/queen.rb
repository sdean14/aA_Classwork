require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable
    def symbol
        "Q"
    end

    def moves_dirs
        diagonal_dirs + horizontal_dirs
    end

end