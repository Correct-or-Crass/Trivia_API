# require './././app/serializer/game_play_serializer'

class Api::V1::GamePlayApisController < ApplicationController
  def index 
    @answers = WordFacade.multi_word_search(num_param)
    @photo = PhotoFacade.photos(@answers[0])
    require 'pry'; binding.pry
    render json: GamePlaySerializer.new(@photo, @answers[0], @answers), status:200
  end

  private
  def num_param
    if params[:num].present?
      params[:num].to_i
    else
      4
    end
  end
end