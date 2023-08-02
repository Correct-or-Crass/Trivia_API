require "rails_helper"

RSpec.describe "Game Play" do
  context "happy path testing", :vcr do
    it "returns a photo, correct answer and a default of 4 choices" do
      get "/api/v1/game_plays"

      expect(response).to be_successful
      expect(response.status).to be 200
      parse = return_parsed_symbolized_data(response)[:data][:attributes]
      expect(parse).to be_a Hash
      expect(parse).to have_key (:photo)
      expect(parse[:photo]).to be_a Hash
      expect(parse[:photo]).to have_key (:image_url)
      expect(parse[:photo][:image_url]).to be_a String
      expect(parse[:photo][:image_url]).to include ("https://images.unsplash.com/")
      expect(parse[:photo]).to have_key (:creator_name)
      expect(parse[:photo][:creator_name]).to be_a String
      expect(parse[:photo]).to have_key (:creator_link)
      expect(parse[:photo][:creator_link]).to be_a String
      expect(parse[:photo][:creator_link]).to include ("https://api.unsplash.com/photos/")
      expect(parse).to have_key (:answer)
      expect(parse[:answer]).to be_a String
      expect(parse).to have_key (:choices)
      expect(parse[:choices]).to be_a Array
      expect(parse[:choices]).to include (parse[:answer])
      expect(parse[:choices].length).to eq (4)
    end

    it "returns a photo, correct answer and specified amount of choices" do
      num = 6
      get "/api/v1/game_plays?num=#{num}"
      
      expect(response).to be_successful
      expect(response.status).to be 200

      parse = return_parsed_symbolized_data(response)[:data][:attributes]
      expect(parse[:choices].length).to eq (6)
    end


    # Bryan - can you handle these cases?
    # OAuth error: The access token is invalid
    xit "returns data related to 10 choices if request amount is greater than 10 " do
      num = 12
      get "/api/v1/game_plays?num=#{num}"
      
      expect(response).to be_successful
      expect(response.status).to be 200

      parse = return_parsed_symbolized_data(response)[:data][:attributes]
      expect(parse[:choices].length).to eq (10)
    end

  end
  
  #Bryan - can you handle these cases?
  # OAuth error: The access token is invalid
  xcontext "sad path testing", :vcr do
    it "returns an error if param is an empty string" do 
      num = " "
      get "/api/v1/game_plays?num=#{num}"
  
      expect(response).to be_successful
      expect(response.status).to be 200

    end

    it "returns an error if param is not an integer" do 
      num = "B!"
      get "/api/v1/game_plays?num=#{num}"
  
      expect(response).to be_successful
      expect(response.status).to be 200

    end
  end
end