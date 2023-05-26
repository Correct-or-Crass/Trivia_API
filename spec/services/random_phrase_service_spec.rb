require 'rails_helper'

RSpec.describe 'Random Phrase Service' do 
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
                expect(@response[:data][:id]).to eq '32' 

                expect(@response[:data][:type]).to be_a String
                expect(@response[:data][:type]).to eq 'insult'

                expect(@response[:data][:attributes]).to be_a Hash
                expect(@response[:data][:attributes].keys).to eq [:insult_phrase]
                expect(@response[:data][:attributes].values).to eq ["You have miles to go before you reach mediocre."]
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
                expect(@response[:data][:id]).to eq '9'

                expect(@response[:data][:type]).to be_a String
                expect(@response[:data][:type]).to eq 'compliment'

                expect(@response[:data][:attributes]).to be_a Hash
                expect(@response[:data][:attributes].keys).to eq [:compliment_phrase]
                expect(@response[:data][:attributes].values).to eq ["Everything would be better if more people were like you!"]
            end 
        end
    end
end