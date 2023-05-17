require 'rails_helper'

RSpec.describe 'Random Phrase' do 
    describe 'Happy Path' do 
        context 'insult', :vcr do 
            before do 
                @response = RandomPhraseService.generate_phrase('insults')
            end

            it 'can return an insult response' do 
                expect(@response).to be_a Hash
                expect(@response.keys).to eq [:data]

                expect(@response[:data]).to be_a Hash
                expect(@response[:data].keys).to eq [:id, :type, :attributes]

                expect(@response[:data][:id]).to be_a String
                expect(@response[:data][:id]).to eq '1'

                expect(@response[:data][:type]).to be_a String
                expect(@response[:data][:type]).to eq 'insult'

                expect(@response[:data][:attributes]).to be_a Hash
                expect(@response[:data][:attributes].keys).to eq [:insult_phrase]
                expect(@response[:data][:attributes].values).to eq ["You're about as useful as a screen door on a submarine."]
            end
        end

        context 'compliment', :vcr do 
            before do 
                @response = RandomPhraseService.generate_phrase('compliments')
            end

            it 'can return a compliment response' do 
                expect(@response).to be_a Hash
                expect(@response.keys).to eq [:data]

                expect(@response[:data]).to be_a Hash
                expect(@response[:data].keys).to eq [:id, :type, :attributes]

                expect(@response[:data][:id]).to be_a String
                expect(@response[:data][:id]).to eq '21'

                expect(@response[:data][:type]).to be_a String
                expect(@response[:data][:type]).to eq 'compliment'

                expect(@response[:data][:attributes]).to be_a Hash
                expect(@response[:data][:attributes].keys).to eq [:compliment_phrase]
                expect(@response[:data][:attributes].values).to eq ["Who raised you? They deserve a medal for a job well done."]
            end 
        end
    end
end