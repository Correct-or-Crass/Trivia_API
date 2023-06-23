require "rails_helper"
require "./lib/modules/serviceable"

RSpec.describe "Endgame" do
  describe "happy path", :vcr do
    context "when both params (wins & rounds) are received returns the EndgameSerializer#json_response" do
      before(:each) do
        wins   = 4
        rounds = 6
        get "/api/v1/endgame?wins=#{wins}&rounds=#{rounds}"
        @parsed_response = Serviceable.parse_json(@response)
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

        parsed_response = Serviceable.parse_json(response)

        expect(response.status).to eq(200)
        
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:data])
        expect(parsed_response[:data].keys).to eq([:type, :attributes])
        expect(parsed_response[:data][:attributes].keys).to eq([:phrase, :gif])
        expect(parsed_response[:data][:attributes][:gif].keys).to eq([:url, :title, :rating])
      end

      it "affirms default wins & rounds count are used NO params are recieved - (cruel version of client game)" do
        get "/api/v1/endgame"

        parsed_response = Serviceable.parse_json(response)

        expect(response.status).to eq(200)
        
        expect(parsed_response).to be_a Hash
        expect(parsed_response.keys).to eq([:data])
        expect(parsed_response[:data].keys).to eq([:type, :attributes])
        expect(parsed_response[:data][:attributes].keys).to eq([:phrase, :gif])
        expect(parsed_response[:data][:attributes][:gif].keys).to eq([:url, :title, :rating])
      end

    end
  end
end