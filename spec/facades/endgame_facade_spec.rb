require 'rails_helper'

RSpec.describe 'Endgame Facade' do
  describe 'Happy Path' do
    context "the score determines the phrase type (insult or compliment)" do
      let(:percentage_1) { EndgameFacade.score_percentage(2) }
      let(:percentage_2) { EndgameFacade.score_percentage(4) }


      it "#score_percentage returns the percentage correct_answers; default total_questions = 5" do

        expect(percentage_1).to be_a Float
        expect(percentage_1).to be <= 60
        expect(percentage_2).to be >= 60

        #percentage_1 = (2.0/5.0 = 40.0); percentage_ 2 = (4.0/5.0 = 80.0)
        expect(percentage_1).to be_within(0.01).of(40.0)
        expect(percentage_2).to be_within(0.01).of(80.0)
      end    

      it "returns the phrase type based on the percentage of correct answers" do

      end

    end
  end
end