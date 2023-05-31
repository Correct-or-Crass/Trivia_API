require 'rails_helper'

RSpec.describe 'Word Facade' do
  describe 'Happy Path' do
    context 'responses with word facade', :vcr do
      it 'repsonses with a random word' do
        response = WordFacade.find_word

        expect(response).to be_a String
        expect(response.split.count).to eq 1
      end
      
      it 'repsonses with multiple random words' do
        response = WordFacade.multi_word_search(4)
        
        expect(response).to be_an Array
        expect(response.count).to eq 4
        expect(response[0]).to eq response[0].capitalize
      end
    end
  end
end
