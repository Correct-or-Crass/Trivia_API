class PhotoFacade
  def self.photos(word)
    @photo = Unsplash::Photo.search("#{word}")
  end

  def self.single_photo
    @photo.sample.to_json
  end
end