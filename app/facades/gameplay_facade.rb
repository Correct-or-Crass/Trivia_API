class GameplayFacade
  def self.get_words_answer_pics(word_count)
    words = WordFacade.multi_word_search(word_count)
    answer = words.sample
    
    #placeholder for Bryan's code
    photo = PhotoService.unsplash_search(answer)

    [words, answer, photo[:results][0][:urls][:raw]]
  end
end