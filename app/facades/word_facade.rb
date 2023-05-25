class WordFacade
  def self.find_word
    response = WordService.word_search

    response[:data][:attributes][:word]
   
  end

  def self.multi_word_search(num)
    response = WordService.multi_word(num)
    words = []
    
    response.map do |r|
      Word.new(r)
    end
  end
end