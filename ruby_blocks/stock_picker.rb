def stock_picker(array)
  
  profit = 0
  days = []
  n = array.size - 2

  array[1..array.size].reverse.each do |sell|
    array[0..n].reverse.each do |buy|
      if sell - buy > profit
        profit = sell - buy
        days = [array.index(buy), array.rindex(sell)]
      end
    end
    n -= 1
  end

  return days
end