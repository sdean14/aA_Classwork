def my_min(list)
  list.each_with_index do |ele1, idx1|
    min = true
      list.each_with_index do |ele2, idx2|
        next if idx1 == idx2
        min = false if ele2 < ele1 
      end
      return ele1 if min
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

puts my_min(list)

# time complexity - O(x**2)

def my_min(list) #single iteration
 list.inject {|acc, ele| acc > ele ? acc = ele : acc}
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

puts my_min(list)

#time complexity - O(x)

# create array of all posible sum values, returning max of that 
  #use double iteration to find all max sums

def largest_contiguous_sub_sum(list) #nested implementation

  sub_arrs = []
  early_sums = []

  list.each_with_index do |ele1, idx1|
    early_sums << ele1
    list.each_with_index do |ele2, idx2|
      if idx2 > idx1 # try next if 
        sub_arrs << list[idx1..idx2]
      end
    end
  end


  sums = sub_arrs.map { |sub| sub.length > 1 ? sub.sum : sub.flatten.length }
  sums.concat(early_sums)
  sums.inject {|acc, ele| acc < ele ? acc = ele : acc}

end

# complexity - nested loop creating essentially permutations of original array? plus iteration, plus iteration ?
# complexity prediction -  O(n**3)
# complexity prediction -  O(n^4)
# complexity actual - O(n^3)

def largest_contiguous_sub_sum(list) #single iteration
  largest = list[0]
  current_sum = list[0]
  (1...list.length).each do |i|
    current_sum = (list[i] > current_sum + list[i]) ? list[i] : (current_sum + list[i])
    largest = (largest > current_sum) ? largest : current_sum
  end
  largest
end

#O(n)