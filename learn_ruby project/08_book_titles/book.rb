class Book

  def initialize
  	@title = ""
  end

  def title
    @title
  end

  def title=(name)
    name = name.split
    b = []
    
    b << name[0].capitalize
    
    if name.length > 1
      name[1..-1].each do |word|
      	if word == "and" or word == "the" or word == "a" or word == "an" or word == "of" or word == "in"
      	  b << word
      	else
      	  b << word.capitalize
        end
      end
    end
    @title = b.join(" ")
  end

end