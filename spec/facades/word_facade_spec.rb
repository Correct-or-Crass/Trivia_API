require 'rails_helper'

RSpec.describe 'Word Facade' do
  describe 'Happy Path' do
    context 'responses with word facade', :vcr do
      it 'repsonses with a random word' do
        response = WordFacade.find_word
      end
      it 'repsonses with multiple random words' do
        response = WordFacade.multi_word_search(4)
      end
    end
  end
end