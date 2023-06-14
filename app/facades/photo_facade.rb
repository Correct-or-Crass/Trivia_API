class PhotoFacade
  def self.photos(word)
    @photo = Unsplash::Photo.search("#{word}")
    pr = JSON.parse(@photo.sample.to_json, symbolize_names: true)
    image_url = pr[:attributes][:table][:urls][:raw]
    creator_name = pr[:attributes][:table][:user][:username]
    creator_link = pr[:attributes][:table][:links][:self]
    photo = {"image_url" => image_url, "creator_name" => creator_name, "creator_link" => creator_link}
  end
end