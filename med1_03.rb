class PigLatin
  def self.translate(str)
    str.split(' ').map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(str)
    begins_with_vowel?(str) ? str << 'ay' : send_front_to_back(str) << 'ay'
  end

  def self.begins_with_vowel?(word)
    !!(word.match(/^([aeiou]|[xy][^aeiou])/))
  end

  def self.send_front_to_back(word)
    parts = word.match(/^([^aeiou]*qu|[^aeiou]+)(\w*)/)
    parts[2] + parts[1]
  end
end

# vowels, nothing
# consonants go to the end
# qu or consonaent in front of qu goes to the end
# x and y goes to end unless followed by consonant
# ^([^aeiou]*qu|[^aeiou]+)
# ^([aeiou]|[xy][^aeiou])

