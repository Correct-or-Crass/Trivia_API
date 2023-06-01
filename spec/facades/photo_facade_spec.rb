require 'rails_helper'

RSpec.describe "Photo Facade" do
  describe 'Photo', :vcr do
    it 'makes an API call using the Unsplash gem' do
      response = PhotoFacade.photo("cat")
      parse = JSON.parse(response, symbolize_names: true)

      expect(parse).to be_a Hash
      expect(parse).to have_key (:attributes)
      expect(parse[:attributes]).to be_a Hash
      # require 'pry'; binding.pry
      expect(parse[:attributes]).to have_key (:table)
      expect(parse[:attributes][:table]).to be_a Hash
      expect(parse[:attributes][:table]).to have_key (:id)
      expect(parse[:attributes][:table][:id]).to be_a String
      expect(parse[:attributes][:table]).to have_key (:urls)
      expect(parse[:attributes][:table][:urls]).to be_a Hash
      expect(parse[:attributes][:table][:urls]).to have_key (:raw)
      expect(parse[:attributes][:table][:urls][:raw]).to be_a String
      expect(parse[:attributes][:table][:urls][:raw]).to include "https://images.unsplash.com/photo"
      expect(parse[:attributes][:table][:urls]).to have_key (:user)
      expect(parse[:attributes][:table][:urls][:user]).to be_a Hash
      expect(parse[:attributes][:table][:urls][:user]).to have_key (:name)
      expect(parse[:attributes][:table][:urls][:user][:name]).to be_a String
      expect(parse[:attributes][:table][:urls][:user]).to have_key (:links)
      expect(parse[:attributes][:table][:urls][:user][:links]).to be_a Hash
      expect(parse[:attributes][:table][:urls][:user][:links]).to have_key (:self)
      expect(parse[:attributes][:table][:urls][:user][:links]).to be_a String
      expect(parse[:attributes][:table][:urls][:user][:links]).to include "https://api.unsplash.com/users"



    end
  end
end