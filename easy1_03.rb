class Octal
  def initialize(string)
    @number = string.to_i
  end

  def to_decimal
    decimal = 0
    @number.to_s.reverse.chars.each_with_index do |digit, idx|
      decimal += digit.to_i * 8 ** idx
    end
    decimal
  end
end

p Octal.new('1').to_decimal
p Octal.new('130').to_decimal
