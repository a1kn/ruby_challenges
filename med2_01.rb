class Palindromes
  def initialize(max_factor: nil, min_factor: 1) 
    @max = max_factor
    @min = min_factor
    @palindromes = Hash.new { |hash, key| hash[key] = [] } 
  end

  def generate
    @min.upto(@max) do |num|
      num.upto(@max) do |num2|
        product = num * num2 
        @palindromes[product] << [num, num2] if palindrome?(product) 
      end
    end
  end

  def palindrome?(value)
    value.to_s == value.to_s.reverse
  end

  def find_factors(num)
    factors = []
    @max.downto(@min) do |n|
      next if num / n > @max
      num % n == 0 ? factors << [n, (num / n)] : next
    end
    factors.map(&:sort).uniq
  end

  def smallest
    Struct.new(:value, :factors).new(min_prod, @palindromes[min_prod])
  end

  def largest
    Struct.new(:value, :factors).new(max_prod, @palindromes[max_prod])
  end

  def min_prod
    @palindromes.keys.min
  end

  def max_prod
    @palindromes.keys.max
  end

end

p = Palindromes.new(max_factor: 999, min_factor: 100)
p.generate
p p.smallest.factors
p p.largest.factors
