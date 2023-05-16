require 'rails_helper'

RSpec.describe 'Giphy Service' do
  describe 'Happy Path' do
    context 'responses based on phrase argument', :vcr do
      before do
        @response = GiphyService.gif_search("If I throw a stick, will you leave?")
      end 

      it 'responds with high level keys: data, pagination, meta' do
        expect(@response).to be_a(Hash)
        expect(@response.keys).to eq([:data, :pagination, :meta])
        
        expect(@response[:data]).to be_a(Array)
        expect(@response[:data][0]).to be_a(Hash)

        expect(@response[:pagination]).to be_a(Hash)
        expect(@response[:pagination].keys).to eq([:total_count, :count, :offset])
        
        expect(@response[:meta]).to be_a(Hash)
        expect(@response[:meta].keys).to eq([:status, :msg, :response_id])
      end

      it 'responds with pagination>count & meta>status in integer datatypes' do
        expect(@response[:pagination][:count]).to be_a(Integer)
       
        #default response limit is set to 20
        expect(@response[:pagination][:count]).to eq(20)
        
        expect(@response[:meta][:status]).to be_a(Integer)
        expect(@response[:meta][:status]).to eq(200)
      end

      it 'responds with data which has keys: id, type, url, title, rating, import_datetime' do
        expect(@response[:data].count).to eq(@response[:pagination][:count])

        @response[:data].each do |gif|
          expect(gif[:id]).to be_a(String)
          expect(gif[:url]).to be_a(String)
          expect(gif[:rating]).to be_a(String)
          expect(gif[:title]).to be_a(String)
          
          expect(gif[:type]).to eq('gif')
        end
      end
    end
  end
end