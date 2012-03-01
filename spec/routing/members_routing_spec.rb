require "spec_helper"

describe MembersController do

  describe "routing" do

    it "routes to index" do
      get("/members").should route_to("members#index")
    end

    it "routes to new" do
      get("/members/new").should route_to("members#new")
    end

    it "routes to create" do
      post("/members").should route_to("members#create")
    end

    it "routes to pending" do
      get("/members/pending").should route_to("members#pending")
    end

    it "routes to approve" do
      put("/members/1/approve").should route_to("members#approve", :id => "1")
    end

  end

end