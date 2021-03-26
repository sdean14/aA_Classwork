#generate and store (in arr) all possible anagrams of str1, 
#then check if str2 is one of these
require 'byebug'
def first_anagram?(str1, str2)
  debugger
  arr = str1.split("")
  ana = arr.permutation.to_a
  arr2 = str2.split("")
  ana.any? { |word| word == arr2 }
end

#time complexity - O(n!)

#iterate thru str1, find idx of each char in str1 in str2, delete 
#those indiceis in str2, then say if str2 is empty and all indices are found, true 

def second_anagram?(str1, str2) 
  arr = str1.split("")
  arr2 = str2.split("")
  indices = []
  arr.each do |letter| 
    if arr2.include?(letter)
      index = arr2.index(letter)
      indices << index
      arr2.delete_at(index)
    end
  end
  arr2.empty? && indices.length == arr.length
end

#time complexity - O(x)

#sort strings alphabetically, check for equality
def third_anagram?(str1, str2) 
  
end

def jumble_sort(str)
  alpha = (a..z).to_a
  sorted = false
    until sorted
      
    end
end

# hashes!
##BONUS with one hash
def fourth_anagram?(str1, str2)

end

str1 = "lom"
str2 = "olm"
p second_anagram?(str1, str2)
