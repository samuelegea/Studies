# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order, and each of their nodes contains a single digit. 
# Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 

# Example 1:


# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.
# Example 2:

# Input: l1 = [0], l2 = [0]
# Output: [0]
# Example 3:

# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]
 

# Constraints:

# The number of nodes in each linked list is in the range [1, 100].
# 0 <= Node.val <= 9
# It is guaranteed that the list represents a number that does not have leading zeros.

# FIRST TRY
# passed 212ms
def change_linked_list_into_array(first_element)
  array = []
  element = first_element
  loop do
    array.push(element.val)
    break if element.next.nil?

    element = element.next
  end
  array
end

def add_two_numbers(l1, l2)
  arr1 = change_linked_list_into_array(l1).reverse
  arr2 = change_linked_list_into_array(l2).reverse

  ans = arr1.map(&:to_s).join('').to_i + arr2.map(&:to_s).join('').to_i
  ans.to_s.split('').reverse.map(&:to_i)
end
# SECOND TRY
# passed 96ms
def change_linked_list_into_array(first_element)
  array = []
  element = first_element
  loop do
    array.push(element.val)
    element = element.next

    break unless element
  end
  array
end

def add_two_numbers(l1, l2)
  arrays = [change_linked_list_into_array(l1).reverse, change_linked_list_into_array(l2).reverse]
  arrays.map { |a| a.map(&:to_s).join('').to_i }.sum.to_s.split('').reverse.map(&:to_i)
end

