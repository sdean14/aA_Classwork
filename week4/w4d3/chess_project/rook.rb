require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable
    
    def symbol
        "R"
    end

    def moves_dirs
        horizontal_dirs
    end

end