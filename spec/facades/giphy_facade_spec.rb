require 'rails_helper'

RSpec.describe 'Giphy Facade' do
  describe 'Happy Path' do
    context 'responses with gif data count > 0', :vcr do
      before do
        @response = GiphyFacade.mean_or_nice("If I throw a stick, will you leave?")
      end 

      it 'returns an array containing a hash with  url, title, rating key-value pairs' do
        expect(@response).to be_a(Array)
        expect(@response.count).to eq(1)
        
        expect(@response[0]).to be_a(Hash)
        expect(@response[0].keys).to eq([:url, :title, :rating])
        expect(@response[0][:url]).to be_a(String)
        expect(@response[0][:title]).to be_a(String)
        expect(@response[0][:rating]).to be_a(String)
      end
    end

    context "returned value adheres to the rating hierarchy, where R > PG/PG-13 > G", :vcr do    
      it "returns a sample from of an 'R' rated gif if service response has one" do
        nsfw_response = GiphyFacade.mean_or_nice("nsfw")
        
        expect(nsfw_response[0][:rating]).to_not eq(("g").to_json)
        expect(nsfw_response[0][:rating]).to_not eq(("pg-13").to_json)
        expect(nsfw_response[0][:rating]).to_not eq(("pg").to_json)

        expect(nsfw_response[0][:rating]).to eq(("r").to_json)
      end

      it "returns a sample from of an 'PG' rated gif if service response has one but no R or PG-13 gifs" do
        barney_response = GiphyFacade.mean_or_nice("Mother's Day")

        expect(barney_response[0][:rating]).to_not eq(("g").to_json)
        expect(barney_response[0][:rating]).to_not eq(("pg-13").to_json)
        expect(barney_response[0][:rating]).to_not eq(("r").to_json)
        
        expect(barney_response[0][:rating]).to eq(("pg").to_json)
      end
    end
  end
end