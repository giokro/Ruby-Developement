# Comment
class Pet
  attr_accessor :name, :age, :gender, :color
end

# kata
class Cat < Pet
end

# Gvela
class Snake < Pet
  attr_accessor :length
end

# Dagli
class Dog < Pet
  def bark(num)
    num.times { puts "Woof!\n" }
  end
end
