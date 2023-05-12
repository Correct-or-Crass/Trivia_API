require 'rails_helper'

RSpec.describe 'Giphy Facade' do
  describe 'Happy Path' do
    context 'responses with gif data count > 0', :vcr do
      before do
        @response = GiphyFacade.mean_or_nice("If I throw a stick, will you leave?", "r")
      end 

      it 'returns an array containing a hash with  url, title, rating key-value pairs' do
        expect(@response).to be_a(Array)
        expect(@response[0]).to be_a(Hash)
        
        expect(@response[0].keys).to eq([:url, :title, :rating])
        expect(@response[0][:url]).to be_a(String)
        expect(@response[0][:title]).to be_a(String)
        expect(@response[0][:rating]).to be_a(String)
      end
    end
  end
end