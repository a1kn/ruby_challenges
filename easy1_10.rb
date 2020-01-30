RULES = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

class Integer
  def to_roman 
    roman = ''
    num = self
    loop do
      value = RULES.select { |k, v| v <= num }.first
      break if value.nil?
      roman << value[0]
      num -= value[1]
    end
    roman
  end

end

