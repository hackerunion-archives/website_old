require 'spec_helper'

describe MembersController do

  it "lists all members" do
    m1 = Member.create! :name => "Jim"
    m2 = Member.create! :name => "Aldric"
    get :index
    assigns[:members].first.name.should == "Jim"
    assigns[:members].last.name.should == "Aldric"
    response.should render_template("index")
  end

end
