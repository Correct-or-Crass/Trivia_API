require "rails_helper"

RSpec.describe "Endgame" do
  describe "happy path", :vcr do
    context "when both params (wins & rounds) are received returns the EndgameSerializer#json_response" do
      before(:each) do
        wins   = 4
        rounds = 6
        get "/api/v1/endgame?wins=#{wins}&rounds=#{rounds}"
        @parsed_response = return_parsed_symbolized_data(@response)
      end

      it "confirms the response status, and top and second level keys and value datatypes" do
        expect(@response.status).to eq(200)
        
        expect(@parsed_response).to be_a Hash
        expect(@parsed_response.keys).to eq([:data])

        expect(@parsed_response[:data]).to be_a Hash
        expect(@parsed_response[:data].keys).to eq([:type, :attributes])

        expect(@parsed_response[:data][:type]).to eq("endgame")
        expect(@parsed_response[:data][:attributes]).to be_a Hash
      end

      it "affirms attribute values and datatypes" do  
        expect(@parsed_response[:data][:attributes].keys).to eq([:phrase, :gif])
        expect(@parsed_response[:data][:attributes][:phrase]).to be_a String

        expect(@parsed_response[:data][:attributes][:gif]).to be_a Hash
        expect(@parsed_response[:data][:attributes][:gif].keys).to eq([:url, :title, :rating])
        @parsed_response[:data][:attributes][:gif].each do |key, value|
          expect(value).to be_a String
        end
      end
    end

    context "if one or both params (wins & rounds) are NOT received, still returns the EndgameSerializer#json_response" do
      it "affirms default round count is used if only wins is recieved" do
        wins = 2
        get "/api/v1/endgame?wins=#{wins}"

        parsed_response = return_parsed_symbolized_data(response)

        expect(response.status).to eq(200)
        
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:data])
        expect(parsed_response[:data].keys).to eq([:type, :attributes])
        expect(parsed_response[:data][:attributes].keys).to eq([:phrase, :gif])
        expect(parsed_response[:data][:attributes][:gif].keys).to eq([:url, :title, :rating])
      end

      it "affirms default wins & rounds count are used NO params are recieved - (cruel version of client game)" do
        get "/api/v1/endgame"

        parsed_response = return_parsed_symbolized_data(response)

        expect(response.status).to eq(200)
        
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:data])
        expect(parsed_response[:data].keys).to eq([:type, :attributes])
        expect(parsed_response[:data][:attributes].keys).to eq([:phrase, :gif])
        expect(parsed_response[:data][:attributes][:gif].keys).to eq([:url, :title, :rating])
      end

    end
  end

  describe "sad path", :vcr do
    it "returns an error with message if params are not integers" do
      wins   = "d"
      rounds = 6
      get "/api/v1/endgame?wins=#{wins}&rounds=#{rounds}"

      parsed_response = return_parsed_symbolized_data(response)

      expect(parsed_response).to be_a Hash
      expect(parsed_response.keys).to eq([:errors])

      expect(parsed_response[:errors]).to be_a Array
      expect(parsed_response[:errors].count).to eq(1)
      expect(parsed_response[:errors][0]).to be_a Hash

      expect(parsed_response[:errors][0].keys).to eq([:title, :detail, :status, :source])
      
      expect(parsed_response[:errors][0][:title]).to eq("Bad Request")
      expect(parsed_response[:errors][0][:detail]).to eq("invalid value for Integer(): \"d\"")
      expect(parsed_response[:errors][0][:status]).to eq("400")
      expect(parsed_response[:errors][0][:source]).to eq(:pointer=>request.original_fullpath)
    end

    it "returns an error with message if wins params > rounds params" do
      wins   = 7
      rounds = 6
      get "/api/v1/endgame?wins=#{wins}&rounds=#{rounds}"

      parsed_response = return_parsed_symbolized_data(response)

      expect(parsed_response).to be_a Hash
      expect(parsed_response[:errors]).to be_a Array
      expect(parsed_response[:errors][0]).to be_a Hash
      expect(parsed_response[:errors][0].keys).to eq([:title, :detail, :status, :source])

      expect(parsed_response[:errors][0][:title]).to eq("Bad Request")
      expect(parsed_response[:errors][0][:detail]).to eq("Wins must be less than or equal to Rounds")
      expect(parsed_response[:errors][0][:status]).to eq("400")
      expect(parsed_response[:errors][0][:source]).to eq(:pointer=>request.original_fullpath)
    end
  end
end