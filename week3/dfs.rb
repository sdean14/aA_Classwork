class PolyTreeNode

def dfs(target = nil, &prc)

  return self if self.value == target
  children.each do |child|
    result = child.dfs(&prc)
    return result unless result.nil?
  end

  nil
end

end