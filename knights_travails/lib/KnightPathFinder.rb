class KnightPathFinder

  # def self.build_move_tree

  # end

  #   0 1 2 3 4 5 6 7 j
  # 0
  # 1
  # 2
  # 3
  # 4
  # 5
  # 6
  # 7
  
  # i

  def self.valid_moves(pos)
    i = pos[0]
    j = pos[1]
    valid = []
    if i + 2 >= 0 && i + 2 < 8
      if j + 1 < 8 
        valid << [i + 2, j + 1]
      end  
      if j - 1 >= 0  
        valid << [i + 2, j - 1]
      end  
    end   
    if i - 2 >= 0 && i - 2 < 8
      if j + 1 < 8 
        valid << [i - 2, j + 1]
      end  
      if j - 1 >= 0  
        valid << [i - 2, j - 1]
      end  
    end  
    if i - 1 >= 0 && i - 1 < 8
      if j + 2 < 8 
        valid << [i - 1, j + 2]
      end  
      if j - 2 >= 0  
        valid << [i - 1, j - 2]
      end 
    end   
    if i + 1 >= 0 && i + 1 < 8
      if j + 2 < 8 
        valid << [i + 1, j + 2]
      end  
      if j - 2 >= 0  
        valid << [i + 1, j - 2]
      end  
    end
    valid
  end


  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @board = Array.new(8) { Array.new(8) }
    @considered_positions = [pos]

  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos).select{|position| !@considered_positions.include?(position)}
    @considered_positions += new_positions
    return new_positions   
  end

end