require 'spec_helper'

describe ApplicationHelper do

  context 'User logged out' do
    it "should display login link if no one is logged in" do
        helper.login_or_logout_link.should match(/login/i)
    end
    it "should display sign up link if no one is logged in" do
      helper.sign_up_or_edit_profile_link.should match(/Sign up/i)
    end
  end

  context 'User logged in' do
    before :each do
      @user = FactoryGirl.create :member, email: "jim@example.com",
                                     password: "fakepass", admin: false
      sign_in @user
    end

    it "should display edit profile link if user is logged in" do
      helper.sign_up_or_edit_profile_link.should match(/Edit profile/i)
    end

    it "should display logout link if user is logged in" do
      helper.login_or_logout_link.should match(/logout/i)
    end

    it "should not have a pending members link" do
      helper.pending_members_link.should be_nil
    end

    it "should not have a pending events link" do
      helper.pending_events_link.should be_nil
    end
  end

  context 'Admin logged in' do
    before :each do
      @admin = FactoryGirl.create :member, email: "jim@example.com",
                                     password: "fakepass", admin: true
      sign_in @admin
    end

    it "should have a pending members link" do
      helper.pending_members_link.should eq link_to('Pending Members', pending_members_path)
    end

    it "should have a pending events link" do
      helper.pending_events_link.should eq link_to('Pending Events', pending_events_path)
    end
  end

end
