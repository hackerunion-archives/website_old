require 'spec_helper'

describe ApplicationHelper do

  context 'User logged out' do
    it 'should display login link if no one is logged in' do
        helper.login_or_logout_link.should match(/login/i)
    end
    it 'should display sign up link if no one is logged in' do
      helper.sign_up_or_edit_profile_link.should match(/Sign up/i)
    end
  end

  context 'User login logged in' do
    before :each do
      @member = FactoryGirl.create :member, email: 'jim@example.com',
                                     password: 'fakepass', admin: false
      sign_in @member
    end

    it 'should display edit profile link if user is logged in' do
      helper.sign_up_or_edit_profile_link.should match(/Edit profile/i)
    end

    it 'should display logout link if user is logged in' do
      helper.login_or_logout_link.should match(/logout/i)
    end

    it 'gives nil buttons if user is not an admin' do
      e = FactoryGirl.create :event, approved: false
      helper.action_buttons(e).should be_empty
    end
  end

  context 'Admin logged in' do
    before :each do
      @admin = FactoryGirl.create :member, email: 'jim@example.com',
                                     password: 'fakepass', admin: true
      sign_in @admin
    end

    it 'gives a link to approve a pending event' do
      m = FactoryGirl.create :member, name: "Jason"
      e = FactoryGirl.create :event, approved: false, member: m
      happy_button = button_to 'Approve', approve_event_path(e), :method => 'put', class: 'btn btn-mini'
      helper.action_buttons(e).should eq happy_button
    end

    it 'gives a link to approve a pending announcement' do
      m = FactoryGirl.create :member, name: "Jason"
      a = FactoryGirl.create :announcement, approved: false, member: m
      happy_button = button_to 'Approve', approve_announcement_path(a), :method => 'put', class: 'btn btn-mini'
      helper.action_buttons(a).should eq happy_button
    end

    it 'hides approve button if event has been approved' do
       e = FactoryGirl.create :event, approved: true

       helper.action_buttons(e).should_not match 'Approve'
    end

    it 'gives links to edit or destroy an approved event' do
      m = FactoryGirl.create :member, name: "Jason"
      e = FactoryGirl.create :event, approved: true, member: m
      edit = link_to 'Edit', edit_event_path(e), class: 'btn btn-mini'
      destroy = link_to 'Destroy', event_path(e), :method => :delete, :confirm => 'Are you sure?', class: 'btn btn-mini btn-danger'
      helper.action_buttons(e).should eq edit + destroy
    end
  end

end
