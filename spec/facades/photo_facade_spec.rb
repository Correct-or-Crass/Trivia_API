require 'rails_helper'

RSpec.describe 'Photo Facade' do
  describe 'Photo', :vcr do
    it 'makes an API call using the Unsplash gem' do
      response = PhotoFacade.photos("cat")
      response_json = response.to_json
      parse = JSON.parse(response_json, symbolize_names: true)

      expect(parse).to be_a Array
      parse.each do |photo|
        expect(photo).to be_a Hash
      end
    end
    it 'returns a single Unsplash photo' do
      single_response = PhotoFacade.single_photo
      single_photo = JSON.parse(single_response, symbolize_names: true)
      
      expect(single_photo).to be_a Hash
      expect(single_photo).to have_key (:attributes)
      expect(single_photo[:attributes]).to be_a Hash
      expect(single_photo[:attributes]).to have_key (:table)
      expect(single_photo[:attributes][:table]).to be_a Hash
      expect(single_photo[:attributes][:table]).to have_key (:id)
      expect(single_photo[:attributes][:table][:id]).to be_a String
      expect(single_photo[:attributes][:table]).to have_key (:urls)
      expect(single_photo[:attributes][:table][:urls]).to be_a Hash
      expect(single_photo[:attributes][:table][:urls]).to have_key (:raw)
      expect(single_photo[:attributes][:table][:urls][:raw]).to be_a String
      expect(single_photo[:attributes][:table][:urls][:raw]).to include "https://images.unsplash.com/photo"
      
      expect(single_photo[:attributes][:table]).to have_key (:user)
      expect(single_photo[:attributes][:table][:user]).to be_a Hash
      expect(single_photo[:attributes][:table][:user]).to have_key (:name)
      expect(single_photo[:attributes][:table][:user][:name]).to be_a String
      expect(single_photo[:attributes][:table][:user]).to have_key (:links)
      expect(single_photo[:attributes][:table][:user][:links]).to be_a Hash
      expect(single_photo[:attributes][:table][:user][:links]).to have_key (:self)
      expect(single_photo[:attributes][:table][:user][:links][:self]).to be_a String
      expect(single_photo[:attributes][:table][:user][:links][:self]).to include "https://api.unsplash.com/users"
    end
  end
end