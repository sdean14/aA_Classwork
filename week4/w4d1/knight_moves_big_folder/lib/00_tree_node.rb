require "byebug"


class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  # def parent=(other_node)                         #refactored -- bit cleaner

  #   unless @parent == nil
  #     @parent.children.delete(self)
  #   end

  #   unless other_node == nil || @parent.children.include?(self)
  #     @parent.children << self
  #   end

  #   @parent = other_node

  # end

  def parent=(node)
    unless node == nil
      if @parent == nil
        @parent = node 
          unless @parent.children.include?(self)
            @parent.children << self
          end
      else
        @parent.children.delete(self)
        @parent = node 
        unless @parent.children.include?(self)
            @parent.children << self
        end
      end
    else 
      @parent = node
    end
  end

  def add_child(child_node)
    child_node.parent = (self)
  end

  def remove_child(child_node)
    child_node.parent = nil
    if !children.include?(child_node)
      raise 'node is not a child'
    end
  end

  def dfs(target_value)
    if self.value == target_value
      return self
    end

    self.children.each do |child|
      search_result = child.dfs(target_value) 
      return search_result unless search_result == nil
    end
    nil
  end


  def bfs(target_value)  
    # debugger                        #while arr != [] --> enqueue and dequeue
    arr = [self]
    until arr.empty?
      current_value = arr[0]
      arr.shift
      if current_value.value == target_value
        return current_value
      else
        current_value.children.each do |child|
          arr << child
        end
      end
    end
    nil
  end

end
                                                                   #nil accounts for 2 things: #
                                                                    #1. if there are no children you hit nil  
                                                                    #2. if you have ended the each loop w/out finding target you return nil
  