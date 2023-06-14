require 'rails_helper'
require './././lib/modules/serviceable'

RSpec.describe "Game Play" do
  context 'game play', :vcr do
    it 'returns a photo, correct answer and group of choices' do
      num = nil
      get "/api/v1/game_play_apis?num=#{num}"

      expect(response).to be_successful
      expect(response.status).to be 200

      require 'pry'; binding.pry
      parse = Serviceable.parse_json(response)
    end
  end
end