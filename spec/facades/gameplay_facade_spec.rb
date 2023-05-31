require 'rails_helper'

RSpec.describe 'Gameplay Facade' do
  describe 'Happy Path' do
    context 'return results based on score', :vcr do 
      it 'can return a collection of compliment phrase and gif for winning score' do 
        
        word_count = 4 #value should come from query or use default
        words_pic_package = GameplayFacade.get_words_answer_pics(word_count)
        
      end
    end
  end
end