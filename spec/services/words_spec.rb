require "rails_helper"

RSpec.describe 'Words Api' do
  context "creates a word", :vcr do
    before do
     @word = WordFacade.find_word
    end
    
    it "creates a new word from api" do
      expect(@word).to be_a(String)
    end

  end
end