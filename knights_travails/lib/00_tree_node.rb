class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) if !@parent.nil?
    @parent = new_parent
    unless new_parent.nil?     
        if !new_parent.children.include?(self)
            new_parent.children << self
        end
      end
  end

  def add_child(child)
    child.parent = self      
  end

  def remove_child(child)
    raise "error" if child.parent == nil
    child.parent = nil
  end

#Searchable

  def dfs(target)
    return self if self.value == target
    return nil if @children.empty?

    @children.each do |child|
      result = child.dfs(target)
      return result if result 
    end
    nil
  end
  
  def bfs(target_value)

    new_arr = [self]
    until new_arr.empty?
      new_arr.concat(new_arr[0].children)
      return new_arr[0] if new_arr[0].value == target_value
      new_arr.shift
      end
    nil
    end

end