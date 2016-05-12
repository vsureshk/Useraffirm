require "rails_helper"

RSpec.describe UserVerifyController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_verify/index").to route_to("user_verify#index")
    end

    it "routes to #new" do
      expect(:get => "/user_verify/new").to route_to("user_verify#new")
    end

    it "routes to #show" do
      expect(:get => "/user_verify/1").to route_to("user_verify#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_verify/1/edit").to route_to("user_verify#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_verify/create").to route_to("user_verify#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_verify/1").to route_to("user_verify#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_verify/1").to route_to("user_verify#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_verify/1").to route_to("user_verify#destroy", :id => "1")
    end

    it "routes to #email_verify" do
      expect(:post => "/user_verify/1/email_verify").to route_to("user_verify#email_verify", :id => "1")
    end

    it "routes to #mobile_verify" do
      expect(:post => "/user_verify/1/mobile_verify").to route_to("user_verify#mobile_verify", :id => "1")
    end
  end
end
