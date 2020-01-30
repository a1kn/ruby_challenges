class Clock
  attr_reader :time

  def initialize(hour=0, min=0)
    @time = [hour, min]
    fix_clock
  end

  def fix_clock
    until @time[1] < 60
      @time[1] -= 60 
      @time[0] += 1
    end
    
    @time[0] -= 24 until @time[0] < 24

    until @time[1] >= 0
      @time[1] += 60
      @time[0] -= 1
    end
    
    @time[0] += 24 until @time[0] >= 0
    
    @time
  end

  def self.at(hour=0, min=0)
    Clock.new(hour, min)
  end

  def to_s
    "%02d:%02d" % @time
  end

  def +(min)
    Clock.new(@time[0], (@time[1] + min))
  end

  def -(min)
    Clock.new(@time[0], (@time[1] - min))
  end

  def ==(other)
    time == other.time
  end
end

