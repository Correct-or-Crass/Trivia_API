class WordFacade
  def self.find_word
    response = WordService.word_search

    response[:data][:attributes][:word]
      # response.map do |r|
      # Word.new(r)
      # end
  end
end