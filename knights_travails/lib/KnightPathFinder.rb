require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder

  attr_reader :root_node, :board, :considered_positions, :move_tree

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
    #@board = Array.new(8) { Array.new(8) }
    @considered_positions = [pos]
    @move_tree = build_move_tree
  end

  def build_move_tree
    queue = [self.root_node] # [7, 1] [7, 6] [0, 1] [0, 6]
    
    queue.each do |node|      
      new_move_positions(node.value).each do |pos|
        #next if new_move_positions(node.value).empty?
        node.add_child(PolyTreeNode.new(pos))
        queue += node.children
      end
    end 
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos).select{|position| !@considered_positions.include?(position)}
    @considered_positions += new_positions
    return new_positions   
  end
 


  
#Part2

  def  find_path(end_pos)
    self.root_node.dfs(end_pos) #.trace_path_back.map {|ele| ele.value}  
  end

  def trace_path_back
    return [self] if self.parent.nil?
    last = self.parent
    self.trace_path_back.unshift(last.trace_path_back)
  end


end
p kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
p kpf.move_tree

#  p r1 = KnightPathFinder.new([7, 1])
#  #p r1.build_move_tree
#  p '----------------------'
#  p r2 = KnightPathFinder.new([5, 2])
#  #p r2.build_move_tree
#  p r2.root_node.children[0].value 
#  p '-------------'
#  p r1.root_node.children
#  p '-----------------------'
#  p r1.find_path([5, 2]).value
#  #p r1.find_path([7, 3]).value
 

