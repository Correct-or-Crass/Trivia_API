class Api::V1::TriviaApisController < ApplicationController
  def index
    phrase = # needed from other api call
    gifs = GiphyFacade.mean_or_nice(phrase)
  end
end