class Luhn
  def initialize(num)
    @number = num
  end

  def self.formula(num)
    new = []
    num.to_s.chars.reverse.map(&:to_i).each_with_index do |digit, idx| 
      if idx.odd? 
        (digit * 2) > 9 ? new.prepend((digit * 2) - 9) : new.prepend(digit * 2)
      else
        new.prepend(digit) 
      end
    end
    new
  end

  def addends
    self.class.formula(@number)
  end

  def checksum
    addends.sum 
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    count = 0
    new_num = num.to_s << '0'
    
    until formula(new_num).sum % 10 == 0
      new_num[-1] = count.to_s
      count += 1
    end

    new_num.to_i
  end
end # 8739560 8739530
