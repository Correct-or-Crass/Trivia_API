class WordFacade
  def self.find_word
    response = WordService.word_search
    response[:data][0][:attributes][:word]
   
  end

  def self.multi_word_search(num)
    responses = WordService.multi_word(num) 
    words = [] 
    responses[:data].select do |response|
      words << response[:attributes][:word]
    end
    words
    word = words.sample
    word_output = {"answer" => word, "choices" => words}
  end
end
