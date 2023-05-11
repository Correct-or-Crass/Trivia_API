class Api::V1::TriviaApiController < ApplicationController
  def index
    
    phrase = ChatGPTFacade.method("ok")
    rating = "r"
    gifs = GiphyFacade.mean_or_nice(phrase,rating)
  end
end