require 'rails_helper'

RSpec.describe 'Endgame Facade' do
  describe 'Happy Path' do
    context "the game score determines the phrase type (insult or compliment)" do
      let(:percentage_1) { EndgameFacade.score_percentage(2) }
      let(:percentage_2) { EndgameFacade.score_percentage(3) }
      let(:percentage_3) { EndgameFacade.score_percentage(4) }

      it "#score_percentage returns the correct_answers percentage based on the default value of total_questions (5 Qs)" do
        expect(percentage_1 && percentage_2 && percentage_3).to be_a Float
        expect(percentage_1).to be <= 60
        expect(percentage_2 && percentage_3).to be >= 60

        #percentage_1 = (2.0/5.0 = 40.0); percentage_ 2 = (4.0/5.0 = 80.0)
        expect(percentage_1).to be_within(0.01).of(40.0)
        expect(percentage_2).to be_within(0.01).of(60.0)
      end    

      it "returns the phrase type based on the percentage of correct answers" do
        type_1 = EndgameFacade.find_phrase_type(percentage_1)
        type_2 = EndgameFacade.find_phrase_type(percentage_2)
        type_3 = EndgameFacade.find_phrase_type(percentage_3)

        expect(type_1 && type_2).to be_a String
        expect(type_1).to eq("insult")
        expect(type_2 && type_3).to eq("compliment")
      end

      it "#score_percentage and #find_phrase_type opperate correctly if total_questions count changes from the default" do
        percentage_4 = EndgameFacade.score_percentage(5, 10) 
        type_4 = EndgameFacade.find_phrase_type(percentage_4)

        expect(percentage_4).to be_within(0.01).of(50.0)
        expect(type_4).to eq("insult")
      end
    end
  end
end