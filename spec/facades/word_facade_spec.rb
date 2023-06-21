require 'rails_helper'

RSpec.describe 'Word Facade' do
  describe 'Happy Path' do
    context 'responds with word facade', :vcr do
      it 'responses with a random word' do
        response = WordFacade.find_word

        expect(response).to be_a String
        expect(response.split.count).to eq (1)
      end
      
      it 'responds as a hash with an answer and an array of choices which includes the answer' do
        response = WordFacade.multi_word_search(4)
        
        expect(response).to be_an Hash
        expect(response.count).to eq (2)
        expect(response["answer"]).to be_a String
        expect(response["choices"]).to be_a Array
        expect(response["choices"].count).to eq (4)
        expect(response["choices"]).to include (response["answer"])
      end
    end
  end
end
