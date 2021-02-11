module Slideable

HORIZONTAL_DIRS = [[1,0], [0, 1], [-1, 0], [0, -1]]
DIAGONAL_DIRS = [[1,1], [-1, -1], [-1, 1], [1, -1]]


  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    valid_moves = []
    moves_dirs.each do |arr|
        valid_moves.concat(grow_unblocked_moves_in_dir(arr[0], arr[1]))
    end
    valid_moves
  end

  def moves_dirs
    raise "need moves_dir in specific piece class"
  end

  def grow_unblocked_moves_in_dir(dx, dy) # (1, -1)
    valid_pos = []
    a = true
    while a == true
      x, y = pos 
      new_x = x + dx 
      new_y = y + dy 
      pos = [new_x, new_y] 
      if board[pos] == NullPiece.instance
        valid_pos << pos
      elsif board[pos].color != self.color && new_x < 8 && new_x >= 0 && new_y < 8 && new_y >= 0
        valid_pos << pos
        break
      else
        break
      end

    end
    valid_pos # [[5,3], [6,2], [7,1] ]
  end




end #end of class

