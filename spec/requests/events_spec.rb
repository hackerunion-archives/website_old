require 'spec_helper'

describe "Events" do
  describe "GET /events" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get events_path
      response.status.should be(302)
      response.should redirect_to root_path
    end
  end
end
