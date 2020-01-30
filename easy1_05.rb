class SumOfMultiples
  def initialize(*nums)
    @multiples = nums
  end

  def self.to(num, multiples = [3, 5])
    sum = 0
    1.upto(num - 1) do |time| 
      sum += time if multiples.any? { |mult| time % mult == 0 }
    end
    sum
  end

  def to(num)
    self.class.to(num, @multiples)
  end
end
