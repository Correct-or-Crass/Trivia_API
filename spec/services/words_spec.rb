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

      expect(@word[:data]).to be_an Array
      expect(@word[:data][0].count).to eq 3
      expect(@word[:data].count).to eq 1

      expect(@word[:data][0].keys).to eq [:id, :type, :attributes]

      expect(@word[:data][0][:id]).to be_a String
      expect(@word[:data][0][:type]).to be_a String
      expect(@word[:data][0][:type]).to eq 'word'

      expect(@word[:data][0][:attributes]).to be_a Hash
      expect(@word[:data][0][:attributes].keys).to eq [:word]
      expect(@word[:data][0][:attributes].values).to be_an Array
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