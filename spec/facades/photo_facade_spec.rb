require 'rails_helper'

RSpec.describe 'Photo Facade' do
  describe 'Photo', :vcr do
    it 'makes an API call using the Unsplash gem and returns a photo with credits' do
      response = PhotoFacade.photos("cat")
      response_json = response.to_json
      parse = JSON.parse(response_json, symbolize_names: true)
      
      expect(parse).to be_a Hash
      expect(parse).to have_key(:image_url)
      expect(parse[:image_url]).to be_a String
      expect(parse[:image_url]).to include "https://images.unsplash.com/"
      expect(parse).to have_key(:creator_name)
      expect(parse[:creator_name]).to be_a String
      expect(parse).to have_key(:creator_link)
      expect(parse[:creator_link]).to be_a String
      expect(parse[:creator_link]).to include "https://api.unsplash.com/photos/"
    end
  end
end