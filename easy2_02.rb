class Scrabble
  def initialize(word)
    @word = validate_input(word)
  end

  def validate_input(word)
    return nil if word.nil? || word.empty?
    word.downcase.scan(/[a-z]/i)
  end

  def score
    score = {
      1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
      2 => ['d', 'g'],
      3 => ['b', 'c', 'm', 'p'],
      4 => ['f', 'h', 'v', 'w', 'y'],
      5 => ['k'],
      8 => ['j', 'x'],
      10 => ['q', 'z']
    }
    return 0 if @word.nil? || @word.empty?
    @word.map { |c| score.select { |k, v| v.include?(c) }.first[0] }.reduce(:+)
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

