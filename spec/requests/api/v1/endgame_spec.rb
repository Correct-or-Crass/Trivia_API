require "rails_helper"
require "./lib/modules/serviceable"

RSpec.describe "Endgame" do
  describe "happy path", :vcr do
    context "sucessfule request response" do
      before(:each) do
        wins = 4
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
        @parsed_response[:data][:attributes][:gif].each do |key, value|
          expect(value).to be_a String
        end
      end
    end
  end
end