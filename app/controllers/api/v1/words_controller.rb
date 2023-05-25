class Api::V1::WordsController < ApplicationController
  def index 
    @word = WordFacade.find_word
    
  end
end