module Enumerable
  

  def my_each
    0.upto(self.size - 1) do |i|
      yield(self.to_a[i]) if block_given?
    end
    self
  end


  def my_each_with_index
    0.upto(self.size - 1) do |i|
      yield(self.to_a[i], i) if block_given?
    end
    self
  end


  def my_select
    return self unless block_given?
    selected = []
    for i in self
        selected << i if yield(i)
    end
    selected
  end


  def my_all?
    if block_given?
      for i in self
        return false unless yield(i)
      end
    end
    true
  end


  def my_any?
    if block_given?
      for i in self
        return true if yield(i)
      end
      return false
    end
    return true if self != nil
    false
  end


  def my_none?
    for i in self
      if block_given?
        return false if yield(i)
      else
        return false if i != nil && i != false
      end
    end
    true
  end

 
  def my_count(arg=nil)
    counter = 0
    for i in self
      if block_given?
        counter += 1 if yield(i)
      elsif arg != nil
        counter += 1 if i == arg
      else
        counter += 1
      end
    end
    counter
  end


  def my_map(&block)
    map = []
    if block_given?
      for i in self
        map << block.call(i)
      end
      map
    else
      self
    end
  end


  def my_inject(n=nil)
    memo = n == nil ? self.first : n
    m = n == nil ? self.my_count - 1 : self.my_count
    for i in self.last(m)
      memo = yield(memo, i)
    end
    memo
  end

end


def multiply_els(array)
  array.my_inject{ |memo, n| memo * n }
end
