require "./lib/modules/serviceable.rb"

class GiphyService
  include Serviceable
  def self.gif_search(phrase)
    root = Serviceable.root_with_credentials("https://api.giphy.com", "api_key", "giphy_api_key")

    response = root.get("/v1/gifs/search") do |search|
      search.params["q"] = phrase
      search.params["limit"] = 20   # setting as default for now;
      search.params["rating"] = "r"
    end
    Serviceable.parse_json(response) 
  end
end