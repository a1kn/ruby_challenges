class DNA
  def initialize(str)
    @strand = str
  end

  def hamming_distance(str)
    distance = 0
    [@strand, str].min_by(&:length).length.times do |idx|
      @strand[idx] == str[idx] ? next : distance += 1
    end
    distance
  end
end
