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

  it "presents a new member form" do
    get :new
    assigns[:member].should_not be_nil
    response.should render_template("new")
  end

  it "creates a new member" do
    post :create, {:member => {:name => "Jim"}}
    response.should render_template("create")
    Member.last.name.should == "Jim"
  end

end
