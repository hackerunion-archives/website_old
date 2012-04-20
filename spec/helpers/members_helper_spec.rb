require 'spec_helper'

describe MembersHelper do

  it "creates a commalist of affiliation names" do
    m = Member.new :name => "Jim"
    a1 = m.affiliations.build
    a1.name = "Cyrus"
    a2 = m.affiliations.build
    a2.name = "Something Else"

    helper.affiliations_list_for(m).should eq "Cyrus, Something Else"
  end

  it "generates html for an Ambassador button" do
    user = FactoryGirl.create :member, name: "LoggedIn", admin: true,
                                  email: "jim@example.com", password: "fakepass"
    sign_in user
    m = FactoryGirl.create :member, name: "Jason"

    happy_button = button_to('Toggle Ambassador Status', toggle_ambassador_member_path(m.id), method: 'put', class: 'btn btn-primary')
    helper.toggle_ambassador_button(m.id).should eq happy_button
  end

  it "does not generate html for an Ambassador button when not admin" do
    user = FactoryGirl.create :member, name: "LoggedIn", admin: false,
                              email: "jim@example.com", password: "fakepass"
    sign_in user
    m = FactoryGirl.create :member, name: "Jason"

    helper.toggle_ambassador_button(m.id).should be_nil
  end

  it "generates html for an Admin button" do
    user = FactoryGirl.create :member, name: "LoggedIn", admin: true,
                                  email: "jim@example.com", password: "fakepass"
    sign_in user
    m = FactoryGirl.create :member, name: "Jason"

    happy_button = button_to('Toggle Admin Status', toggle_admin_member_path(m.id), method: 'put', class: 'btn btn-primary')
    helper.toggle_admin_button(m.id).should eq happy_button
  end

  it "does not generate html for an Admin button when not admin" do
    user = FactoryGirl.create :member, name: "LoggedIn", admin: false,
                              email: "jim@example.com", password: "fakepass"
    sign_in user
    m = FactoryGirl.create :member, name: "Jason"

    helper.toggle_admin_button(m.id).should be_nil
  end

  it "creates a commalist of skill names" do
    m = Member.new :name => "Jim"
    a1 = m.skills.build
    a1.name = 'Rails'
    a2 = m.skills.build
    a2.name = 'Karate Do'

    helper.skills_list_for(m).should eq 'Rails, Karate Do'
  end

end