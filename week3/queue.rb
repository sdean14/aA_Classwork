class MyQueue

  def initialize
    @inner_array = [] #array as underlying data structure
  end

  def enqueue(el)
    inner_array.unshift(el) #removing el from right side

    self
  end

  def dequeue
    inner_array.pop
  end

  def show
    inner_array.dup #show copy, doesn't maniulate actual inner arr
  end

  def empty?
    inner_array.empty?
  end

  private
  attr_reader :inner_array #can't call innerarr outside of class, give us implicit self for rest
end