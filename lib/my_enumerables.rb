module Enumerable

  def my_each_with_index 
    return to_enum(:my_each_with_index) unless block_given?
    i = 0
    for v in self do
      yield v,i
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    output = []
    for v in self do
      if yield(v) == true
        output.push(v)
      end
    end
    return output
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    for v in self do
      if yield(v) == false
        return false
      end
    end
    return true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    for v in self do
      if yield(v) == true
        return true
      end
    end
    return false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    for v in self do
      if yield(v) == true
        return false
      end
    end
    return true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    for v in self do
      if yield(v) == true
        count += 1
      end
    end
    return count
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    new_array = []
    for v in self do
      new_array.push(yield(v))
    end
    return new_array
  end

  def my_inject(accumulator = nil)
    self.size.times do |index|
      if accumulator == nil && index == 0
        accumulator = self[index]
        next
      end
      accumulator = yield accumulator, self[index]    
    end
    accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return to_enum(:my_each) unless block_given?
    for el in self do
      yield el
    end
  end
end
