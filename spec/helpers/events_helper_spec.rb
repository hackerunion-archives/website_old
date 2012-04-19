require 'spec_helper'

describe EventsHelper do

  def sign_in_admin
    @admin = FactoryGirl.create :member, name: "LoggedIn", admin: true,
                                  email: "jim@admin.com", password: "fakepass"
    sign_in @admin
  end

  def sign_in_member
    @member = FactoryGirl.create :member, name: "LoggedIn", admin: false,
                                  email: "jim@notadmin.com", password: "fakepass"
    sign_in @member
  end

  it 'gives a link to approve a pending event' do
    sign_in_admin
    m = FactoryGirl.create :member, name: "Jason"
    e = FactoryGirl.create :event, approved: false, member: m
    happy_button = button_to 'Approve', approve_event_path(e), :method => 'put', class: 'btn btn-mini'
    helper.action_buttons(e).should eq happy_button
  end

  it 'gives nil buttons if user is not an admin' do
    sign_in_member
    e = FactoryGirl.create :event, approved: false
    helper.action_buttons(e).should be_empty
  end

  it 'hides approve button if event has been approved' do
    sign_in_admin
    e = FactoryGirl.create :event, approved: true

    helper.action_buttons(e).should_not match 'Approve'

  end

  it 'gives links to edit or destroy an approved event' do
    sign_in_admin
    m = FactoryGirl.create :member, name: "Jason"
    e = FactoryGirl.create :event, approved: true, member: m
    edit = link_to 'Edit', edit_event_path(e), class: 'btn btn-mini'
    destroy = link_to 'Destroy', event_path(e), :method => :delete, :confirm => 'Are you sure?', class: 'btn btn-mini btn-danger'
    helper.action_buttons(e).should eq edit + destroy
  end

end