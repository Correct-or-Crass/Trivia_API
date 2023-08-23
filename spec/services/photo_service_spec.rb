require 'rails_helper'

RSpec.describe 'Photo Service' do
  describe 'Happy Path' do
    context 'gets responses based on word given with up to 11 images', :vcr do
      it "responds with info of interest (keys) and values that have consistent datatypes" do
        word = "earth"
        response = PhotoService.unsplash_photo_search(word)
        expect(response).to be_a(Hash)
        expect(response[:results]).to be_a(Array)
        expect(response[:results].count).to be <= (11)

        response[:results].each do |photo|
          # info to get the image and have option of selecting most popular image 
          expect(photo[:urls][:regular]).to be_a(String)
          expect(photo[:likes]).to be_a(Integer)
          expect(photo[:urls]).to be_a Hash
          expect(photo[:urls].keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])
          expect(photo[:urls][:raw]).to be_a String
          expect(photo[:urls][:raw]).to include("https://images.unsplash.com/")
          
          # accounting for the fact that the following could be nil
          # info to confirm word is related to the image via the descriptions 
          expect(photo[:description]).to be_a(String) unless photo[:description].nil?
          expect(photo[:alt_description]).to be_a(String) unless photo[:alt_description].nil?
          
          # info to give credit to user who uploaded the image
          expect(photo[:user][:username]).to be_a(String) unless photo[:user][:username].nil?
          expect(photo[:user][:links][:html]).to be_a(String) unless photo[:user][:links][:html].nil?
        end
      end
    end
  end
end