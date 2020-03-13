require 'minitest/autorun'
require './lab1_classes'

# Tests for lab1 classes
class TestLab1Pet < Minitest::Test
  def setup
    @pet = Pet.new
  end

  def test_pet
    assert(defined? @pet.name, 'Pet has no accessor atribute name')
    assert(defined? @pet.age, 'Pet has no accessor atribute age')
    assert(defined? @pet.gender, 'Pet has no accessor atribute gender')
    assert(defined? @pet.color, 'Pet has no accessor atribute color')
  end
end

# Tests for lab1 classes
class TestLab1Cat < Minitest::Test
  def setup
    @cat = Cat.new
  end

  def test_cat
    assert_kind_of(Pet, @cat, 'Your cat is not a pet')
  end
end

# Tests for lab1 classes
class TestLab1Snake < Minitest::Test
  def setup
    @snake = Snake.new
  end

  def test_snake
    assert_kind_of(Pet, @snake, 'Your snake is not a pet')
    assert(defined? @snake.length, 'Snake has no accessor atribute length')
  end
end

# Tests for lab1 classes
class TestLab1Dog < Minitest::Test
  def setup
    @dog = Dog.new
    out = StringIO.new
    $stdout = out
  end

  def test_dog
    assert_kind_of(Pet, @dog, 'Your dog is not a pet')
    @dog.bark(5)
    out_string = $stdout.string.gsub(/[\r\n]/, '')
    assert_equal('Woof!Woof!Woof!Woof!Woof!', out_string,
                 'Your dog does not bark correctly')
  end
end
