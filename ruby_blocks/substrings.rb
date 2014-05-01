def substrings(word, dictionary)
  
  substrings_hash = Hash.new(0)

  dictionary.each do |dictionary_word|
    word.downcase.split(/\W/).each do |split_word|
      if split_word.include? dictionary_word
        substrings_hash[dictionary_word] += 1
      end
    end
  end

  return substrings_hash
end