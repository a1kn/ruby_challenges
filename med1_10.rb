class Prime
  def self.nth(nth_num)
    raise ArgumentError if nth_num < 1

    primes = [2]
    num = 3 

    until primes.length == nth_num 
      prime = true

      2.upto(Math.sqrt(num)) do |x|
        prime = false && break if num % x == 0
      end

      primes << num if prime
      num += 2
    end
    
    primes.last
  end
end

