require './lib/modules/serviceable'
class WordService
  def self.conn
   response =  Faraday.new("https://shielded-headland-00998.herokuapp.com")
  end

  def self.word_search
    response = conn.get("/api/v1/words?amount=")
    # JSON.parse(response.body, symbolize_names: true) 
    require 'pry'; binding.pry
    Serviceable.parse_json(response)
  end

  def self.multi_word(num=4)
    response = conn.get("/api/v1/words?amount=#{num}")
    Serviceable.parse_json(response)

    # JSON.parse(response.body, symbolize_names: true)
  end
end