def echo(phrase)
  "#{phrase}"
end

def shout(phrase)
  "#{phrase.upcase}"
end

def repeat(phrase, n = 2)
  (" #{phrase}" * n).strip
end

def start_of_word(phrase, n = 1)
  phrase[0,n]
end

def first_word(phrase)
  phrase.split[0]
end

def titleize(phrase)
  sen = phrase.split
  if sen.length > 2
  	o = sen.length / 3
  	i = 0
  	while i < o
  	  sen[i] = sen[i].capitalize
  	  sen[-(i+1)] = sen[-(i+1)].capitalize
  	  i += 1
    end
  elsif sen.length == 1
  	return sen[0].capitalize
  elsif sen.length == 2
  	sen[0] = sen[0].capitalize
  	sen[-1] = sen[-1].capitalize
  end
  
  return sen.join(" ")
end