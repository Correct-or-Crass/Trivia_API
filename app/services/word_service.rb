require "./lib/service_modules/serviceable.rb"
class WordService
  extend ServiceModules::Serviceable

  def self.word_search
    response = phrases_words_connection.get("/api/v1/words?amount=")
    parse_json(response) 
  end

  def self.multi_word(num=4)
    response = phrases_words_connection.get("/api/v1/words?amount=#{num}")
    parse_json(response) 
  end
end