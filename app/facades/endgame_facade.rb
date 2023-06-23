class EndgameFacade 
  def self.get_phrase_and_gif(wins, rounds)
    perc  = score_percentage(wins, rounds)
    type  = find_phrase_type(perc)
    phrase = get_endgame_phrase(type)
    gif   = get_endgame_gif(phrase)
    
    {phrase: phrase, gif: gif}
  end

  def self.get_endgame_phrase(type)
    endgame_phrase = RandomPhraseService.generate_phrase(type)
    
    if endgame_phrase[:data][:type] == "compliment"
      endgame_phrase[:data][:attributes][:compliment_phrase]
    elsif endgame_phrase[:data][:type] == "insult"
      endgame_phrase[:data][:attributes][:insult_phrase]
    end
  end

  def self.get_endgame_gif(phrase)
    GiphyFacade.mean_or_nice(phrase)
  end

  def self.find_phrase_type(percentage)
    if percentage >= 60.0
      return "compliments"
    else
      return "insults"
    end
  end

  def self.score_percentage(rounds_won, total_rounds)
    (rounds_won.to_f/total_rounds.to_f) * 100
  end
end