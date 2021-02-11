require_relative "piece"
require "byebug"

class Pawn < Piece
    def symbol
        "P"
    end

    

    def moves
        forward_steps + side_attacks
    end

    def at_start_row?
        (self.pos[0] == 1 && self.color == :white) || (self.pos[0] == 6 && self.color == :black)
    end

    def forward_dir
        if self.color == :white
            return 1
        elsif self.color == :black
            return -1
        end
        
    end

    def forward_steps
        valid_moves = []
        x, y = pos
        new_pos_1 = [x + forward_dir, y]
        new_pos_2 = [x + forward_dir + forward_dir, y]
        if at_start_row? && board[new_pos_1] == NullPiece.instance
            valid_moves << new_pos_1
        end
        if at_start_row? && board[new_pos_2] == NullPiece.instance && board[new_pos_1] == NullPiece.instance
            valid_moves << new_pos_2
        elsif board[new_pos_1] == NullPiece.instance 
            valid_moves << new_pos_1        
        end
        valid_moves       
    end

    def side_attacks
        valid_moves = [] #[4, 4]
        x, y = pos
        new_x =  x + forward_dir 
        new_y_1 = y - 1
        new_y_2 = y + 1
        pos_moves = [[new_x, new_y_1], [new_x, new_y_2]]
        if (new_x >= 0 && new_x < 8) && ((new_y_1 >= 0 && new_y_1 < 8) || (new_y_2 >= 0 && new_y_2 < 8))
            pos_moves.each do |move|
               if board[move].color != board[pos].color #Pawn[1,2]
                  valid_moves << move
               end
            end
        end
        valid_moves
    end

end