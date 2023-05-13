class GiphyService
  def self.gif_search(phrase)
    rating = "r"  # setting as default for now; can be changed in the future based on gametype 
    limit = 20    # setting as default for now;
    response = conn.get('/v1/gifs/search') do |search|
      search.params['api_key'] = ENV['giphy_api_key']
      search.params['q'] = phrase
      search.params['rating'] = rating
      search.params['limit'] = limit
    end
      parse_json(response) 
  end

    def self.conn
    Faraday.new('https://api.giphy.com') 
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end