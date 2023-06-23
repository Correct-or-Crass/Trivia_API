class Api::V1::EndgameController < ApplicationController
  def index
    wins = params[:wins] || 0
    rounds = params[:rounds] || 5
    data = EndgameFacade.get_phrase_and_gif(wins, rounds)
    
    render json: EndgameSerializer.json_response(data)
  end
end