require "rails_helper"
require "./lib/modules/serviceable"

RSpec.describe "Error Requests" do
  describe "#route_not_found captures any invalid url" do
    context "expect reponse to have error objects with three level" do
      it "inspects the different keys & values datatypes" do
        get "/api/v1/game_play_apissssss"
        expect(response.status).to eq(400)
        
        parsed_response = Serviceable.parse_json(response)
    
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response.keys).to eq([:errors])

        expect(parsed_response[:errors]).to be_a(Array)
        expect(parsed_response[:errors].count).to eq(1)

        expect(parsed_response[:errors][0].keys).to eq([:title, :detail, :status, :source])
        
        expect(parsed_response[:errors][0][:title]).to be_a(String)
        expect(parsed_response[:errors][0][:detail]).to be_a(String)
        expect(parsed_response[:errors][0][:status]).to be_a(String)

        expect(parsed_response[:errors][0][:source]).to be_a(Hash)
        expect(parsed_response[:errors][0][:source].keys).to eq([:pointer, :parameter])

        expect(parsed_response[:errors][0][:source][:pointer]).to be_a(String)
        expect(parsed_response[:errors][0][:source][:parameter]).to be_a(String)
      end

      it "response includes detailed informaiton about the error" do 
        get "/api/v1/usertypedinwhatevertheywanted-notanendpoint!"
        
        parsed_response = Serviceable.parse_json(response)

        expect(parsed_response[:errors][0][:title]).to eq("Bad Request")
        expect(parsed_response[:errors][0][:detail]).to eq("route not found")
        expect(parsed_response[:errors][0][:status]).to eq("400")

        expect(parsed_response[:errors][0][:source][:pointer]).to eq(request.original_fullpath)
        expect(parsed_response[:errors][0][:source][:parameter]).to eq("usertypedinwhatevertheywanted-notanendpoint!") #this matches the end of the URI
      end
    end
  end
end