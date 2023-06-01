class PhotoFacade
  def self.photo(word)
     photo = Unsplash::Photo.search("#{word}")
     photo.sample.to_json
  end
end