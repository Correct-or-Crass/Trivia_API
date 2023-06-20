require 'rails_helper'

RSpec.describe 'Photo Facade' do
  describe 'Photo', :vcr do
    it 'makes an API call using the Unsplash gem and returns a photo with credits' do
      response = PhotoFacade.photos("cat")
     
      expect(response).to be_a Hash
      expect(response).to have_key("image_url")
      expect(response["image_url"]).to be_a String
      expect(response["image_url"]).to include "https://images.unsplash.com/"
      expect(response).to have_key("creator_name")
      expect(response["creator_name"]).to be_a String
      expect(response).to have_key("creator_link")
      expect(response["creator_link"]).to be_a String
      expect(response["creator_link"]).to include "https://api.unsplash.com/photos/"
    end
  end
end