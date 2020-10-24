require "rails_helper"

RSpec.describe ResourcesCustomsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resources_customs").to route_to("resources_customs#index")
    end

    it "routes to #new" do
      expect(:get => "/resources_customs/new").to route_to("resources_customs#new")
    end

    it "routes to #show" do
      expect(:get => "/resources_customs/1").to route_to("resources_customs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resources_customs/1/edit").to route_to("resources_customs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resources_customs").to route_to("resources_customs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/resources_customs/1").to route_to("resources_customs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/resources_customs/1").to route_to("resources_customs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resources_customs/1").to route_to("resources_customs#destroy", :id => "1")
    end

  end
end
