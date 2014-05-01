def caesar_cipher(str, num)
  
  letters = [*('a'..'z')]
  message = ""
  
  str.split('').each do |letter|
    if letters.index(letter) != nil
      message += letters[(letters.index(letter) + num) % 26]
    elsif letters.index(letter.downcase) != nil
      message += letters[(letters.index(letter.downcase) + num) % 26].upcase
    else
      message += letter
    end
  end
  
  return message
end