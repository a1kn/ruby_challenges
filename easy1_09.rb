class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0

    sum = (1...num).select { |n| num % n == 0 }.sum

    return 'perfect' if sum == num
    return 'deficient' if sum < num
    return 'abundant' if sum > num
  end
end
