require "rails_helper"

RSpec.describe 'Words Api' do
  context "creates a word", :vcr do
    before do
     @word = WordService.word_search
     @words = WordService.multi_word
    end
    
    it "creates a new word from api" do
      expect(@word).to be_a Hash
      expect(@word.keys).to eq [:data]

      expect(@word[:data]).to be_a Hash
      expect(@word[:data].keys).to eq [:id, :type, :attributes]

      expect(@word[:data][:id]).to be_a String
      expect(@word[:data][:type]).to be_a String
      expect(@word[:data][:type]).to eq 'word'

      expect(@word[:data][:attributes]).to be_a Hash
      expect(@word[:data][:attributes].keys).to eq [:word]
      expect(@word[:data][:attributes].values).to be_an Array
    end

    it "can return multiple words" do
      expect(@words).to be_a Hash
      expect(@words[:data]).to be_a Array
      expect(@words[:data].count).to eq 4 #set as default param
      expect(@words[:data][0].keys).to eq [:id, :type, :attributes]
      expect(@words[:data][0][:attributes][:word]).to be_a String
    end
  end
end