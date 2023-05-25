class WordService
  def self.conn
    # require 'pry'; binding.pry
   response =  Faraday.new("https://shielded-headland-00998.herokuapp.com")
  end

  def self.word_search
    
    response = conn.get("/api/v1/words")
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true) 
  end
end