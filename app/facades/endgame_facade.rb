class EndgameFacade 
  #to do:
  #create class method that searchs for phrase and gif
    #method will need to take an argument (rounds_won, total_rounds (optional))
  def self.get_phrase_and_gif(wins, rounds)
    percentage = score_percentage(wins, rounds)
    type = find_phrase_type(percentage)
    phrase = get_endgame_phrase(type)
    gif = GiphyFacade.mean_or_nice(phrase)
    [phrase, gif]
  end

  #helper method will get the phrase
    # make phrase service call with the #find_phrase_type
  def self.get_endgame_phrase(type) 

  end

  # helper method will get the gif
    #pass phrase to giphy facade

  def self.find_phrase_type(percentage)
    if percentage >= 60.0
      return "compliment"
    else
      return "insult"
    end
  end

  def self.score_percentage(rounds_won, total_rounds = 5)
    (rounds_won.to_f/total_rounds.to_f) * 100
  end
end