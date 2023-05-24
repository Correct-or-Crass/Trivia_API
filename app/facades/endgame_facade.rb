class Endgamefacede 
  def self.phrase_and_giphy(type)
    
    # make phrase service call with the type 
    phrase = RandomPhraseService.generate_phrase(type)
    #pass phrase to giphy facade
    gif = GiphyFacade.mean_or_nice(phrase)

  end
end