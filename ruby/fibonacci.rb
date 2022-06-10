# This is a really nice approach of the fibbonacci problem,
# that uses memoization and do not utilizes recursion to
# ensures that we are able to acheive complexity O(n) instead of
# the normal O(2^n) with the recursive or not memoized approach
# Really nice study and quite simple as well

def fib(n)
  memo = { 1 => 1, 2 => 1 }
  return 1 if memo <= 2

  (3..n).each do |m|
    puts "Calculating the #{m}th of the sequence"
    memo[m] = memo [m-1] + memo[m-2]
  end

  memo[n]
end
