#place holder for Bryan's Upsplash

class PhotoService
  def self.unsplash_search(word)
    response = unsplash_conn.get('/search/photos?') do |search|
      search.params['page'] = 1
      search.params['per_page'] = 1
      search.params['query'] = word
    end
    JSON.parse(response.body, symbolize_names: true)
  end


  def self.unsplash_conn
    Faraday.new('https://api.unsplash.com') do |f|
      f.params[:client_id] = "#{ ENV['access_key'] }"
    end
  end
end