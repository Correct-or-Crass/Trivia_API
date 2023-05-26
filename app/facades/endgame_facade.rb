class EndgameFacade 
  #to do:
  # make phrase service call with the type 
  #pass phrase to giphy facade

  def self.find_phrase_type(percentage)
    if percentage >= 60.0
      return "compliment"
    else
      return "insult"
    end
  end

  def self.score_percentage(correct_answers, total_questions = 5)
    (correct_answers.to_f/total_questions.to_f) * 100
  end
end