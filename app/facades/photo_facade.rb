class PhotoFacade
  def self.photo(word)
     photo = Unsplash::Photo.search("#{word}")
  #    require 'pry'; binding.pry
  #    JSON.parse(response.body, symbolize_names: true)
  end
end