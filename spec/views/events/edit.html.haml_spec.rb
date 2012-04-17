require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :title => "MyString",
      :description => "MyString",
      :approved => "",
      :member_id => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_approved", :name => "event[approved]"
      assert_select "input#event_member_id", :name => "event[member_id]"
    end
  end
end
