require 'rails_helper'


RSpec.describe "Campaigns", :type => :request do
  describe "GET /campaigns" do
    it "visit campaigns page a" do
      user = create(:user)
      sign_in user
      get campaigns_path
      expect(response.status).to be(200)
    end
  end
end
