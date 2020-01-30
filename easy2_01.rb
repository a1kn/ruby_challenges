class OddWords
  def initialize(str)
    @string = str 
  end

  def reverse
    arr = [[]]
    count = 0
    @string.chars.each do |char|
      if char == ' '
        arr[count] << char 
        count += 1 
        arr << []
        next
      elsif char == '.'
        arr[count] << char
        next
      end

      if count.even? 
        arr[count] << char
      elsif count.odd?
        arr[count].prepend(char)
      end
    end
    arr.flatten.join
  end
end

p OddWords.new('whats the matter with Kansas indeed.').reverse
