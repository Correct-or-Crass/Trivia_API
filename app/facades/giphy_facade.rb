class GiphyFacade
  def self.mean_or_nice(phrase, rating)
    response = GiphyService.gif_search(phrase,rating)
  end
end