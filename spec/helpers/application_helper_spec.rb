require 'spec_helper'

describe ApplicationHelper do

  it "should display login link if no one is logged in" do
    helper.login_or_logout_link.should match(/login/i)
  end

  it "should display logout link if user is logged in" do
    user = FactoryGirl.create :member, email: "jim@example.com",
                                   password: "fakepass"
    sign_in user
    helper.login_or_logout_link.should match(/logout/i)
  end

end
