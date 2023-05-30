class EndgameFacade 
  def self.get_phrase_and_gif(wins, rounds)
    percentage = score_percentage(wins, rounds)
    type = find_phrase_type(percentage)
    phrase = get_endgame_phrase(type)
    gif = get_endgame_gif(phrase)
    [phrase, gif]
  end

#  api seems to be down - phrase is currently a hardcoded string with desired code commented out 
  def self.get_endgame_phrase(type)
    # RandomPhraseService.generate_phrase(type)
    "Everything would be better if more people were like you!"
  end

  def self.get_endgame_gif(phrase)
    GiphyFacade.mean_or_nice(phrase)
  end

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