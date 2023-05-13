# require 'pry'; binding.pry

class Api::V1::WordsController < ApplicationController
  def index 
    @word = WordFacade.find_word
    # require 'pry'; binding.pry
  end
end