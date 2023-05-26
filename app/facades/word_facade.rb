class WordFacade
  def self.find_word
    response = WordService.word_search

    response[:data][:attributes][:word]
   
  end

  def self.multi_word_search(num)
    responses = WordService.multi_word(num)    
    responses.map do |response|
      Word.new(response)
    end
  end
end