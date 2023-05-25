require 'rails_helper'

RSpec.describe "Photo Facade" do
  describe 'Happy Path', :vcr do
    it 'returns photo' do
      response = PhotoFacade.photo("cat")
      # require 'pry'; binding.pry
      # parse = JSON.parse(response.body, symbolize_names: true)
    end
  end
end