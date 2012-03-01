require 'spec_helper'

describe UsersController do

  before :each do
    @user = User.create! :email => "jim@example.com", :password => "fakepass"
  end

  describe "GET 'show'" do
    it "returns http success" do
      sign_in @user
      get 'show', {:id => @user}
      response.should be_success
    end
  end

end
