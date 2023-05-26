class EndgameFacade 
  #to do:
  #create class method that searchs for phrase and gif
    #method will need to take an argument (rounds_won, total_rounds (optional))

  #helper method will get the phrase
    # make phrase service call with the #find_phrase_type 

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
    (correct_answers.to_f/total_questions.to_f) * 100
  end
end