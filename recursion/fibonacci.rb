def fibs(n)
  a = 0
  b = 1
  result = "#{a} #{b}"
  return "0" if n == 0
 
  until (n -= 1) == 0
    temp = b
    b += a 
    a = temp
    result += " #{b}"
  end
  result
end


def fibs_rec(n, a = 0, b = 1, result = '0')
  n > 0 ? fibs_rec(n - 1, b, b + a, result += " #{b}") : result
end