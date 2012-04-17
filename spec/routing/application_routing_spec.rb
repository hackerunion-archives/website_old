require "spec_helper"

describe ApplicationController do

  describe "routing" do

    it "routes root to member list" do
      get("/").should route_to("home#index")
    end

  end

end
