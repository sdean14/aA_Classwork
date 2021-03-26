class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
    if num > @store.length || num < 0
      raise 'Out of bounds' 
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num]= false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    raise 'out of range' if num > max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # i= num % 20
    @store[num%20] << num 

  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num%20].include?(num)
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :num_buckets 

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    #@num_buckets = num_buckets
    @count = 0
  end

  def insert(num)
    if !@store[num % @store.length].include?(num)
      @store[num % @store.length] << num
      @count += 1
      resize!
    end #conditional logic for resize

  end

  def remove(num)
    if @store[num % num_buckets].include?(num) 
      @store[num % num_buckets].delete(num)
      @count -=1
    end

  end

  def include?(num)
     @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @count > @store.length
      old = []
      #remove all the items
      @store.each do |sub| #num times?
        old << sub.pop
      end
      #create whole new store
      @store = Array.new(@store.length * 2) { Array.new }
      #get all the old stuff into new positions
      old.each {|num| @store.insert(num) }

    end
  end
end
