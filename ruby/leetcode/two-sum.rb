# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

 

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]
 

# Constraints:

# 2 <= nums.length <= 104
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}


# FIRT TRY
# iteration too slow, complexy order O(nˆ2)

# def two_sum(nums, target)
#   nums.each_with_index do |num, index|
#     nums.slice(index..-1).each do |subnum|
#       pp "check pair => [#{num}, #{subnum}]"
#       return [index, nums.index(subnum)] if (num + subnum) == target
#     end
#   end
# end

# SECOND TRY
# Doesn't pass some edge cases
# def two_sum(nums, target)
#   if target.negative?
#     nums = nums.map(&:-@)
#     target = -target
#   end

#   if target.zero?
#     negs = nums.select(&:negative?)
#     negs.each do |value|
#       if (value + nums[nums.index(value.abs)]).zero?
#         return [nums.index(value), nums.index(value.abs)].sort
#       end
#     end
#   end

#   last_key = nums.reverse.each_with_index do |value, key|
#     break nums.length - key - 1 if (target.zero? && value.zero?) || target.fdiv(value) > 1
#   end

#   first_key = nums.each_with_index do |value, key|
#     pp "check pair => [#{value}, #{nums[last_key]}]"
#     break key if (value + nums[last_key]) == target
#   end

#   pp [first_key, last_key]
# end

# THIRD TRY
# Passed, 888ms
# def two_sum(nums, target)
#   ts = Time.now
#   nums.each_with_index do |num, index|
#     pp "examining #{num}"
#     next if num + nums.max < target

#     index_ans = nums.slice((index + 1)..-1).map { |a| a + num }.index(target)
#     if index_ans
#       pp "It took #{Time.now - ts}s to execute"
#       return [index, index_ans + index + 1]
#     end
#   end
# end

# FOURTH TRY
# passed, 583ms, 211.3MB
def two_sum(nums, target)
  nums.each_with_index do |num, index|

    number_exists = nums.slice((index+1)..-1).index(target - num)

    if number_exists
      return [index, number_exists + index+1]
    end
  end
end

# FASTEST SOLUTION
# 61ms
# def two_sum(nums, target)
#   ts = Time.now
#   hash = {}
#   nums.each_with_index do |value, index|
#     pp "examining #{value}"
#     b = target - value
#     if hash.include?(b)
#       pp "It took #{Time.now - ts}s to execute"
#       return [hash.fetch(b), index] 
#     end

#     hash[value] = index
#   end
# end


# pp two_sum [2,7,11,15], 9
pp two_sum (1..10_000).to_a, 19_999
