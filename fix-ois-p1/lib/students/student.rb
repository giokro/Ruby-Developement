# class
class Student
  attr_accessor :name

  def initialize(name)
    @name = name
    # @fname, @lname = name.split(' ')
  end

  def to_s
    @name
  end
end
