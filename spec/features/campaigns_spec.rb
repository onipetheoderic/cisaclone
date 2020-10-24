require 'rails_helper'

RSpec.feature "Campaigns", type: :feature do
  before :each do
    user = create(:user)
    sign_in user
  end

  # it "displays list of campaigns" do
  #   visit campaigns_path
  #
  #   expect(page).to have_content("New Campaign")
  # end
  #
  # it "new campaigns to direct to new" do
  #   visit campaigns_path
  #   click_link "New Campaign"
  #   expect(page).to have_content("New Campaign")
  # end
end
