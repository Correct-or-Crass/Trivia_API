class PhotoFacade
  def self.photo(word)
     photo = Unsplash::Photo.search("#{word}")
  end
end