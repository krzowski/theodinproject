def translate(word)

  while not word.start_with?("a", "y", "u", "o", "e", "qu")
    word = word[1..-1] + word[0]
  end
  if word.start_with?("qu")
  	word = word[2..-1] + word[0..1]
  end

  return word + "ay"

end