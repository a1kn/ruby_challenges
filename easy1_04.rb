class Trinary
  def initialize(str)
    @num = str
  end

  def to_decimal
    return 0 if invalid_trinary?
    decimal = 0
    @num.reverse.chars.each_with_index do |digit, idx|
      decimal += digit.to_i*3**idx
    end
    decimal
  end

  def invalid_trinary?
    @num.match(/[^0-2]/)
  end
end

p Trinary.new('1').to_decimal
p Trinary.new('2').to_decimal
p Trinary.new('222').to_decimal

