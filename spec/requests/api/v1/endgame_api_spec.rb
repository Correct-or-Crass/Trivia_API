require "rails_helper"
require "./lib/modules/serviceable"

RSpec.describe "Endgame" do
  context "happy path", :vcr do
    it "returns phrase and gif" do
      wins = 4
      rounds = 6
      get "/api/v1/endgame?wins=#{wins}&rounds=#{rounds}"
      


    end
  end
end