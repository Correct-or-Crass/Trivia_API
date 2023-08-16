class PhotoService
  extend ServiceModules::Serviceable

  def self.unsplash_photo_search(word)
    response = conn.get("search/photos") do |search|
      search.params["accept-version"] = "v1"
      search.params["page"]           = 1
      search.params["per_page"]       = 11
      search.params["query"]          = word
    end
    parse_json(response)  
  end

  def self.conn
    root_with_credentials("https://api.unsplash.com","client_id","unsplash_client_id_key")
  end
end
