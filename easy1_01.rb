class Series
  attr_reader :string

  def initialize(string)
    @string = string.chars.map(&:to_i)
  end

  def slices(num)
    count = 0
    arr = []
    if num > string.length 
      raise ArgumentError.new('Slice number should be smaller than string size')
    else
      until count + (num - 1) >= string.length
        arr << string[count..(count + (num - 1))]
        count += 1
      end
    end
    arr
  end 
end

