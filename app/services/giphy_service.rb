require "./lib/modules/serviceable.rb"

class GiphyService
  def self.gif_search(phrase)
    rating = "r"  # setting as default for now; can be edited based on game level (easy, med, hard)
    limit = 20  # setting as default for now;
    response = conn.get("/v1/gifs/search") do |search|
      search.params["q"] = phrase
      search.params["limit"] = limit
      search.params["rating"] = rating
    end
    Serviceable.parse_json(response)  
  end

  def self.conn
    Serviceable.root_with_credentials("https://api.giphy.com","api_key","giphy_api_key")
  end
end