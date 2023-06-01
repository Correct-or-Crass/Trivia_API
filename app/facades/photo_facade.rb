class PhotoFacade
  def self.photo(word)
     photo = Unsplash::Photo.search("#{word}")
     photo.sample.to_json
    #  require 'pry'; binding.pry
  #    JSON.parse(response.body, symbolize_names: true)
  end
end