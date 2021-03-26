#require "./00_tree_node.rb"

class KnightPathFinder

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]
  end

  def self.valid_moves(pos)
    moves = []
    (1..2).each do |idx1|
      (1..2).each do |idx2|
        if idx1 != idx2
        moves << [ pos[0] + idx1, pos[1] + idx2 ]
        moves << [ pos[0] - idx1, pos[1] - idx2 ]
        moves << [ pos[0] + idx1, pos[1] - idx2 ]
        moves << [ pos[0] - idx1, pos[1] + idx2 ]
        end
      end
    end
    good_moves = []
    moves.each do |move|
      if (move[0] >= 0 && move[0] <= 7) && (move[1] >= 0 && move[1] <= 7)
          good_moves << move
      end
    end
    good_moves.uniq
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    moves.reject! { |move| @considered_positions.include?(move) }
    moves.each { |move| @considered_positions << move}
  end

  def build_move_tree
    child_moves = self.new_move_positions(@root_node.value)
    child_moves.map! do |move|
      new_node = PolyTreeNode.new(move)
      new_node.parent = @root_node
    end
  end


end

#pos1 = KnightPathFinder.new([4,4])
p KnightPathFinder.valid_moves([4,4])
p KnightPathFinder.valid_moves([0,4])
