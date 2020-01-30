class School
  def initialize
    @database = Hash.new([])
  end

  def to_h
    @database.sort.map { |grade, names| [grade, names.sort] }.to_h
  end

  def add(name, grade)
    @database[grade] += [name]
  end

  def grade(num)
    @database.fetch(num, [])
  end
end
