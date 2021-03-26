class Stack

def initialize
  @store = []
end

def push(value) #Important
  store << value

  #self #never show internal array to user, return self instead, omitting this returns the last line, less private, can bypass with .send(:var)
end

def pop #Important
  self.store.pop
end

def peek
  store.last #LIFO from end
end

def size
  store.length
end

def empty?
  store.empty?
end

def inspect #overwrites inspect method to output clean console output, different from default behavior
  "#<Stack:#{self.object_id}>"
end

private
attr_reader :store #lets us use implicit self on store, private from user, makes us only call store implicitly
end