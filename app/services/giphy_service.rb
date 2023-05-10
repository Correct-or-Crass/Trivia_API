class GiphyService
  def self.gif_search(phrase,rating)
    response = conn.get('/v1/gifs/search') do |search|
      search.params['api_key'] = ENV['giphy_api_key']
      search.params['q'] = phrase
      search.params['rating'] = rating
    end

    if response.status == 200
      parse_jason(response) 
    end
  end

    def self.conn
    Faraday.new('https://api.giphy.com') 
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end