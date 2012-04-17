require "spec_helper"

describe MembersController do

  describe "routing" do

    it "routes to index" do
      get("/members").should route_to("members#index")
    end

    it "routes to pending" do
      get("/members/pending").should route_to("members#pending")
    end

    it "routes to approve" do
      put("/members/1/approve").should route_to("members#approve", id: "1")
    end

    it "routes to ambassador" do
      put("/members/1/toggle_ambassador").should route_to("members#toggle_ambassador", id: "1")
    end

    it "routes to edit" do
      get("/members/1/edit").should route_to("members#edit", id: "1")
    end

    it "routes to update" do
      put("/members/1").should route_to("members#update", id: "1")
    end

  end

end