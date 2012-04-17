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

  it "should have a pending link" do
    user = FactoryGirl.create :member, admin: true,
           email: "jim@example.com", password: "fakepass"
    sign_in user

    helper.pending_link.should eq link_to('Pending Members', pending_members_path)
  end

end
