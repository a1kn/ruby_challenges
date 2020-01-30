class PhoneNumber
  def initialize(number)
    @number = number
  end
  
  def number
    return '0000000000' if @number.match(/[A-Za-z]/)
    num = convert_to_digits
    (num.size < 10) || num.size > 10 ? '0000000000' : num
  end
  
  def convert_to_digits
    num = @number.scan(/\d/).join
    num.slice!(0) if num.size == 11 && num[0] == '1'
    num
  end
  
  def area_code
    number[0, 3]
  end
    
  def to_s
    "(#{area_code}) #{number[3, 3]}-#{number[6, 4]}"
  end
end

