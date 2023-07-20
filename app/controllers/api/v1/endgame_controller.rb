class Api::V1::EndgameController < ApplicationController
  def index
    number_param
    require 'pry';binding.pry
    data   = EndgameFacade.get_phrase_and_gif(number_param)
    
    render json: EndgameSerializer.json_response(data)
  end

  
  def number_param
    begin
      (Integer(params[:wins]) <= Integer(params[:rounds]))
        wins   = params[:wins].to_i || 0
        rounds = params[:rounds].to_i || 5
        return [wins, rounds]
      # end
    rescue => exception
      require 'pry';binding.pry
    end
  end
end