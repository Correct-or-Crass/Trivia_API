class PhotoFacade
  def self.photo(word)
     response = Unsplash::Photo.search("#{word}")
     require 'pry'; binding.pry
     photo = JSON.parse(response.body, symbolize_names: true)
  end
end