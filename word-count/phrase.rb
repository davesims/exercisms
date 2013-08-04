Phrase = Struct.new(:words) do
  def word_count
    words_array.each_with_object({}) do |word, word_counts|
      word_counts[word] = word_counts[word].to_i + 1 
    end
  end

  private

  def words_array
    words.gsub(/[^\w\s]/, '').downcase.split(" ")
  end
end
