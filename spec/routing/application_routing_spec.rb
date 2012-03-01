require "spec_helper"

describe MembersController do

  describe "routing" do

    it "routes root to member list" do
      get("/").should route_to("members#index")
    end

  end

end
