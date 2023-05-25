require 'rails_helper'

RSpec.describe "Photo Facade" do
  describe 'Happy Path' do
    it 'returns photo' do
      response = PhotoFacade.photo("cat")
      require 'pry'; binding.pry
    end

  end
end