class Api::V1::TriviaApiController < ApplicationController
  def index
    phrase = "Coming from another api"
    rating = "r"
    gifs = GiphyService.gif_search(phrase,rating)
  end
end