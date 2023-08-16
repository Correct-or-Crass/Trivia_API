class Api::V1::EndgameController < ApplicationController
  def index
    evaluated_input = convert_valid_param_to_integers

    if evaluated_input[:score].present?
      data = EndgameFacade.get_phrase_and_gif(evaluated_input[:score]) 
    elsif evaluated_input[:errors]
      error_message = evaluated_input[:errors]
    end
  
    if data.present?
      render json: EndgameSerializer.json_response(data)
    else
      render json: invalid_param_value(error_message), status: :bad_request
    end
  end
end