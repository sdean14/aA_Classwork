require_relative "piece.rb"
require_relative "rook.rb"
require_relative "knight.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require_relative "null.rb"
require_relative "stepable.rb"
require_relative "slideable.rb"

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new()}
        @rows.each_with_index do |row, row_idx|
            if row_idx == 0
                row << Rook.new(:white, self, [0,0])
                row << Knight.new(:white, self, [0,1])
                row << Bishop.new(:white, self, [0,2])
                row << Queen.new(:white, self, [0,3])
                row << King.new(:white, self, [0,4])
                row << Bishop.new(:white, self, [0,5])
                row << Knight.new(:white, self, [0,6])
                row << Rook.new(:white, self, [0,7])
            elsif row_idx == 1
                row << Pawn.new(:white, self, [1,0])
                row << Pawn.new(:white, self, [1,1])
                row << Pawn.new(:white, self, [1,2])
                row << Pawn.new(:white, self, [1,3])
                row << Pawn.new(:white, self, [1,4])
                row << Pawn.new(:white, self, [1,5])
                row << Pawn.new(:white, self, [1,6])
                row << Pawn.new(:white, self, [1,7])
            elsif row_idx == 6
                row << Pawn.new(:black, self, [6,0])
                row << Pawn.new(:black, self, [6,1])
                row << Pawn.new(:black, self, [6,2])
                row << Pawn.new(:black, self, [6,3])
                row << Pawn.new(:black, self, [6,4])
                row << Pawn.new(:black, self, [6,5])
                row << Pawn.new(:black, self, [6,6])
                row << Pawn.new(:black, self, [6,7])
            elsif row_idx == 7
                row << Rook.new(:black, self, [7,0])
                row << Knight.new(:black, self, [7,1])
                row << Bishop.new(:black, self, [7,2])
                row << Queen.new(:black, self, [7,3])
                row << King.new(:black, self, [7,4])
                row << Bishop.new(:black, self, [7,5])
                row << Knight.new(:black, self, [7,6])
                row << Rook.new(:black, self, [7,7])
            else
                row << NullPiece.instance
                row << NullPiece.instance
                row << NullPiece.instance
                row << NullPiece.instance
                row << NullPiece.instance
                row << NullPiece.instance
                row << NullPiece.instance
                row << NullPiece.instance
            end
        end
    end


    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val 

    end

    def move_piece(start_pos, end_pos) 
        piece = self[start_pos]
        raise " there is no piece at start_pos " if self[start_pos] == NullPiece.instance
        unless  end_pos[0] >= 0 && end_pos[0] < 8 && end_pos[1] >= 0 && end_pos[1] < 8
          raise " the piece cannot move to end_pos"
        end
        raise "you can't move there" if !piece.moves.include?(end_pos)

        self[start_pos] = self[end_pos]
        self[end_pos] = piece
        piece.pos = end_pos 
        puts " your move was successful"       
    end
    

end


 chess = Board.new
#   chess.rows[0][0].symbol
 p chess.move_piece([1,0],[4,0])
#   chess.rows[2][0].symbol

# p chess.rows[0][0]
# p chess.rows[4][4]
#  chess.move_piece([0, 0], [4,4])
# p chess.rows[0][0]
# p chess.rows[4][4]
