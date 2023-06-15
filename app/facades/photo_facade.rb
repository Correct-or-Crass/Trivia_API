class PhotoFacade
  def self.photos(word)
    photo_request = Unsplash::Photo.search("#{word}")
    single_photo = JSON.parse(photo_request.sample.to_json, symbolize_names: true)
    image_url = single_photo[:attributes][:table][:urls][:raw]
    creator_name = single_photo[:attributes][:table][:user][:username]
    creator_link = single_photo[:attributes][:table][:links][:self]
    photo = {"image_url" => image_url, "creator_name" => creator_name, "creator_link" => creator_link}
  end
end