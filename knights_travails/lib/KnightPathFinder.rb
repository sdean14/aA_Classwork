require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder

  attr_reader :root_node, :considered_positions

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
    @considered_positions = [pos]
    build_move_tree
  end

  def build_move_tree
    queue = [self.root_node] # [7, 1] [7, 6] [0, 1] [0, 6]
    
    until queue.empty?  
      current_node = queue.shift   
      new_move_positions(current_node.value).each do |pos|
        new_child = PolyTreeNode.new(pos)
        current_node.add_child(new_child)
        queue << new_child
      end
    end 
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos).select{|position| !@considered_positions.include?(position)}
    @considered_positions += new_positions
    return new_positions   
  end
 
  
#Part2

  def find_path(end_pos)
    last = root_node.bfs(end_pos)
    trace_path_back(last).map {|ele| ele.value}.reverse 
  end

  def trace_path_back(node)
    nodes = []
    current_node = node
    until current_node.nil?
      nodes << current_node
      current_node = current_node.parent
    end
    nodes
  end

end

p kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([1, 2])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

 

