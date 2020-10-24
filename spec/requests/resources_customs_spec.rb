require 'rails_helper'

RSpec.describe "ResourcesCustoms", type: :request do
  describe "GET /resources_customs" do
    it "works! (now write some real specs)" do
      get resources_customs_path
      expect(response).to have_http_status(200)
    end
  end
end
