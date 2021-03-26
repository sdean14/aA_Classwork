require "../lib/00_tree_node.rb"
require "byebug"
class KnightPathFinder

  def initialize(position)
    @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]
  end

  def root_node
    @root_node
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
    q = [@root_node]

    until q.empty?
      current_node = q.shift
      
      new_move_positions(current_node.value).each do |pos|
         child = PolyTreeNode.new(pos)
         current_node.add_child(child)
         q << child
      end
      # p @considered_positions.length
    end
    
  end

  def find_path(end_pos)
    destination = @root_node.bfs(end_pos)
    trace_path_back(destination)
  end

  def trace_path_back(node)
    path_array = []
    until node == @root_node
      path_array.unshift(node.value)
      node = node.parent
    end
    path_array.unshift(@root_node.value)
    return path_array
  end

end


starting_position = KnightPathFinder.new([4, 4])

starting_position.build_move_tree
p starting_position.find_path([4, 4])

