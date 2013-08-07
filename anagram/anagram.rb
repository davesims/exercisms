require 'ap'
Anagram = Struct.new(:word) do

  def match(words)
    sorted_word = word.downcase.chars.sort
    ap sorted_word

    matcher = words.each_with_object(Hash.new([])) do |word, matcher|
       matcher[word.downcase.chars.sort] += [word]
       ap matcher
    end
    
    ap matcher
    matcher.map{|matcher, word| word if matcher == sorted_word}.compact
  end

end
