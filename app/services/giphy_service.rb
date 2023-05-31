require "./lib/modules/serviceable.rb"

class GiphyService
  include Serviceable
  def self.gif_search(phrase)
    limit = 20  # setting as default for now;
    rating = "r" 

    root = Serviceable.conn("https://api.giphy.com")

    response = root.get("/v1/gifs/search") do |search|
      search.params["q"] = phrase
      search.params["limit"] = limit
      search.params["rating"] = rating
      search.params["api_key"] = ENV["giphy_api_key"]
    end
    Serviceable.parse_json(response) 
  end

  # def self.root_with_credentials
  #   Serviceable.conn("https://api.giphy.com") do |root|
  #   end
  # end
end