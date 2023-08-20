class Api::V1::GamePlaysController < ApplicationController
  def index 
    number_param =  params[:num].nil? ? 4 : evaluate_params

    if number_param.is_a?(Integer)
      @answers = WordFacade.multi_word_search(number_param)
      @photo = PhotoFacade.photos(@answers["answer"])
      render json: GamePlaySerializer.play_response(@photo, @answers), status:200
    else
      error_message = number_param[:errors]
      render json: invalid_param_value(error_message), status: :bad_request
    end
  end
end