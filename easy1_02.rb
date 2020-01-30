class Sieve
  def initialize(limit)
    @limit = limit
    @numbers = Hash[(2..limit).map { |num| [num, true] }] # initialized hash
  end

  def primes
    find_composites
    @numbers.select { |k, v| v == true }.keys # returns only keys that are "true"
  end

  def find_composites
    multiple = 2 # start at 2
    loop do
      num = multiple + multiple # the number itself is prime, so we start with the next
      break if num > @limit
      loop do
        @numbers[num] = false # marking all composites false
        num += multiple
        break if num > @limit
      end
      multiple = @numbers.select { |k, v| k > multiple && v == true }.keys.first
      break if multiple.nil?  
    end
  end
end

p Sieve.new(100000).primes
