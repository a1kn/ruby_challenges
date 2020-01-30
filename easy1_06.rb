class Anagram
  def initialize(str)
    @word = str
  end

  def match(arr)
    arr.delete_if { |w| w.downcase == @word.downcase }
    arr.select { |each| each.downcase.chars.sort == @word.downcase.chars.sort }
  end
end
