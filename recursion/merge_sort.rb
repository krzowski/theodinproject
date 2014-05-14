def merge_sort(array)
  return array if array.length == 1 
  arr1 = merge_sort(array[0..array.length/2-1])
  arr2 = merge_sort(array[array.length/2..-1])
  sorted_array = []
  until arr1.empty? && arr2.empty?
    if !(arr1.empty? || arr2.empty?)
      if arr1[0] < arr2[0]
        sorted_array << arr1.shift
      else
        sorted_array << arr2.shift
      end
    else
      sorted_array << arr1.shift(arr1.length) unless arr1.empty?
      sorted_array << arr2.shift(arr2.length) unless arr2.empty?
    end
  end
  sorted_array
end