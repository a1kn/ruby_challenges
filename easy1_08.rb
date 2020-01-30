class Phrase
  def initialize(str)
    @words = str.scan(/\b[^\s,]+\b/)
  end

  def word_count
    hash = Hash.new(0)

    @words.each { |word| hash[word.downcase] += 1 }

    hash
  end
end

