
class CircularBuffer
  def initialize(num)
    @buffer = []
    @max = num 
  end

  def write(str)
    return nil if str.nil?
    raise BufferFullException if @buffer.size == @max
    @buffer << str 
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift 
  end

  def write!(str)
    return nil if str.nil?
    if @buffer.size == @max
      @buffer.shift
      @buffer << str
    else
      @buffer << str
    end
  end

  def clear
    @buffer = []
  end

  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end
end
# p CircularBuffer.new(1).read
