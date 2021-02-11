require "byebug"
module Stepable
    KNIGHT_MOVES = [[2,1], [2, -1], [-2, -1], [1, 2], [-1, 2], [-1, -2], [1, -2], [-2, 1]]
    KING_MOVES =  [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1], [-1, 1], [1, -1]]


    def moves
        valid_moves = []
        moves_diffs.each do |arr|
            x, y = pos
            new_x = x + arr[0]
            new_y = y + arr[1]
            new_pos = new_x, new_y
            if board[new_pos] == NullPiece.instance
                valid_moves << new_pos
            elsif board[new_pos].color != self.color && new_x < 8 && new_x >= 0 && new_y < 8 && new_y >= 0
                valid_moves << new_pos
            end
        end
        valid_moves
    end

    def knight_moves
        KNIGHT_MOVES
    end


    def king_moves
        KING_MOVES
    end

    def moves_diffs
        raise "need moves_dir in specific piece class"
    end


end