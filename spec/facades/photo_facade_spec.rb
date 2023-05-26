require 'rails_helper'

RSpec.describe "Photo Facade" do
  describe 'Happy Path', :vcr do
    it 'makes an API call using the Unsplash gem' do
      response = PhotoFacade.photo("cat")
      
      expect(response).to be_a Unsplash::Photo
      expect(response[:urls]).to be_a Unsplash::Client
      expect(response[:urls][:small]).to be_a String
      expect(response[:urls][:small]).to include ("https://images.unsplash.com/")
    end
  end
end