require 'rails_helper'

RSpec.describe 'Word Facade' do
  describe 'Happy Path' do
    context 'responds with word facade', :vcr do
      it 'responses with a random word' do
        response = WordFacade.find_word

        expect(response).to be_a String
        expect(response.split.count).to eq (1)
      end
      
      it 'responds with answer and 4 choices' do
        response = WordFacade.multi_word_search(4)
        
        expect(response).to be_an Array
        expect(response.count).to eq (2)
        expect(response[1]).to be_a Array
        expect(response[1].count).to eq (4)
        expect(response[1]).to include (response[0])
      end
    end
  end
end
