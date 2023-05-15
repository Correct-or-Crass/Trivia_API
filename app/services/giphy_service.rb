class GiphyService
  def self.gif_search(phrase)
    limit = 20
    response = conn.get("/v1/gifs/search") do |search|
      search.params["q"] = phrase
      search.params["limit"] = limit
    end
      parse_json(response) 
  end

  def self.random_trending
    limit = 30
    response = conn.get("/v1/gifs/trending") do |search|
      search.params["limit"] = limit
    end
    # require 'pry';binding.pry
    parse_json(response) 
  end

  def self.conn
    rating = "r"  # setting as default for now; can be changed in the future based on gametype 
    limit = 20   # setting as default for now;
    Faraday.new("https://api.giphy.com") do |connect|
      connect.params["api_key"] = ENV["giphy_api_key"]
      connect.params["rating"] = rating
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end