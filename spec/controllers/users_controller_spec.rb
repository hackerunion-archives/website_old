require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do
    it "returns http success" do
      user = User.create! :email => "jim@example.com", :password => "fakepass"
      sign_in user
      get 'show', {:id => user}
      response.should be_success
    end
  end

end
