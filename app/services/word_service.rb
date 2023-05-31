require "./lib/modules/serviceable.rb"

class WordService
  include Serviceable
  def self.word_search
    response = Serviceable.phrases_words_connection.get("/api/v1/words?amount=")
    Serviceable.parse_json(response) 
  end

  def self.multi_word(num=4)
    response = Serviceable.phrases_words_connection.get("/api/v1/words?amount=#{num}")
    Serviceable.parse_json(response) 
  end
end