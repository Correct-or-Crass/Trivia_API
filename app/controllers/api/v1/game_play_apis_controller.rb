# require 'pry'; binding.pry

class Api::V1::GamePlayApisController < ApplicationController
  def index 
    # @word = WordFacade.find_word
    # require 'pry'; binding.pry
    @answers = WordFacade.multi_word_search(num)
    @photo = PhotoFacade.photos(@answer[0])
    render json: GamePlaySerializer.new(@photo, @answers[0], @answers), status:200
  end
end