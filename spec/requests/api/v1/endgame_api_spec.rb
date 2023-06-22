require "rails_helper"
require "./lib/modules/serviceable"

RSpec.describe "Endgame" do
  context "happy path", :vcr do
    it "returns phrase and gif" do
      get "/api/v1/endgame"
    end
  end
end