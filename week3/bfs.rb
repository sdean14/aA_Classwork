class PolyTreeNode

def bfs(target = nil, &prc)

  nodes =[self]

  until nodes.empty?
    node = nodes.shift

    return node if node.value == target
    nodes.concat(node.children)
  end

  nil
end  

end