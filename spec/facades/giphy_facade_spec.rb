require 'rails_helper'

RSpec.describe 'Giphy Facade' do
  describe 'Happy Path' do
    context 'responses with gif data count > 0', :vcr do      
      it 'returns an array containing a hash with  url, title, rating key-value pairs' do
        response = GiphyFacade.mean_or_nice("If I throw a stick, will you leave?")
      
        expect(response).to be_a(Array)
        expect(response.count).to eq(1)

        expect(response[0]).to be_a(Hash)
        expect(response[0].keys).to eq([:url, :title, :rating])
        expect(response[0][:url]).to be_a(String)
        expect(response[0][:title]).to be_a(String)
        expect(response[0][:rating]).to be_a(String)
      end
    end

    context "response adheres to the rating hierarchy, where R > PG/PG-13 > G", :vcr do    
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

    context "search_phrase has character length constraints" do
      before(:each) do 
        @phrase = "The discovery of the dinosaur skeleton has cast light on why they became extinct."
        @search_phrase = GiphyFacade.word_length_filter(@phrase)
      end
      
      it "selects words from the phrase argument passed in to create the search_phrase string" do
        expect(@phrase).to be_a(String)
        expect(@search_phrase).to be_a(String)

        @search_phrase.split(" ").each do |word|
          expect(@phrase.include?(word)).to eq(true)
        end
      end

      it "limits the search_phrase lenght to less than 50 characters regardless of the phrase's length" do
        expect(@phrase.length).to be > (50)
        expect(@search_phrase.length).to_not be > (50)
      end

      it "words that make up the search_phrase are 4 or more characters" do
        @search_phrase.split(" ").each do |word|
          expect(word.length).to be > (3) 
        end
      end
    end
  end
end