# require 'pry'; binding.pry

class Api::V1::GamePlayApisController < ApplicationController
  def index 
    @word = WordFacade.find_word
    
    word_count = 4
    words_and_picture = GameplayFacade.get_words_answer_pics(word_count)
  end
end