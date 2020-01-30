class SecretHandshake
  def initialize(input)
    if input.class == String
      @binary_num = input.to_i
    elsif input.class == Integer
      @binary_num = convert_to_binary(input)
    else
      @binary_num = 0
    end
  end

  def convert_to_binary(num)
    binary_str = ''
    until num == 0
      binary_str.prepend((num % 2).to_s)
      num /= 2
    end
    binary_str.to_i
  end

  def reverse?
    num = @binary_num
    return false if num < 10000
    count = 0

    until num < 10000
      count += 1
      num -= 10000
    end

    count.odd?
  end

  def reduce_num
    num = @binary_num
    until num < 10000
      num -= 10000
    end
    num
  end

  def commands
    rules = {
      1000 => 'jump',
      100 => 'close your eyes',
      10 => 'double blink',
      1 => 'wink'
    }
    
    commands = []
    num = reduce_num 

    loop do
      value = rules.select { |k, v| k <= num }.first
      break if value.nil?
      commands.prepend(value[1])
      num -= value[0]
    end
    reverse? ? commands.reverse : commands 
  end
end

p SecretHandshake.new('piggies').commands
