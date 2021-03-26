class Node #abstracting individual
  attr_reader :value, :children #all public

  def initialize(value, children = []) #if it has children, we give them, unless just empty arr
    @value = value
    @children = children
  end

#  def add_parent(node)
#    @parent ||= #add parent if it exists
#  end
  #inspect could clean it up
end

d = Node.new('d')
e = Node.new('e')
f = Node.new('f')
g = Node.new('g')
b = Node.new('b', [d, e])
c = Node.new('d', [f, g])
a = Node.new('d', [b, c])

p a.children.first.children #traverse the tree into desired location