require "rails_helper"

RSpec.feature "Welcome Page",type: :feature do
  describe "welcome index" do
    it "contains an image and GitHub link" do
      visit "/"
      expect(page).to have_content("For API Docs & Instructions,")
      expect(page).to have_css("img[src*='https://github.com/Correct-or-Crass/logo/blob/main/Screen%20Shot%202023-05-13%20at%2011.50.47%20AM.png']")
      expect(page).to have_link("click here", href: "https://github.com/Correct-or-Crass/Trivia_API" )
    end
  end
end
        