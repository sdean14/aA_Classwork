require_relative "piece"

class NullPiece < Piece
    include Singleton
    def initialize
        @color = nil      
        @symbol = "N"
    end

    def moves
        []
    end

end