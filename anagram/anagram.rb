require 'ap'
Anagram = Struct.new(:word) do

  def match(words)
    sorted_word = word.downcase.chars.sort

    matcher = words.each_with_object(Hash.new([])) do |word, matcher|
       matcher[word.downcase.chars.sort] += [word]
    end
    
    matcher.map{|matcher, word| word if matcher == sorted_word}.compact.flatten
  end

end
