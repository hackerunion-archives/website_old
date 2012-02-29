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

  it "excludes pending members from member list" do
    m1 = Member.create! :name => "Jim"
    m2 = Member.create! :name => "Aldric", :pending => false
    get :index
    members = assigns[:members]
    members.size.should == 1
    assigns[:members].first.name.should == "Aldric"
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

  it "creates new affiliations for a new member" do
    post :create, {
        :member => {:name => "Jim"},
        :affiliation_list => "Cyrus, Nerf Herders"
    }
    response.should render_template("create")
    member = Member.last
    affiliation_names = member.affiliations.collect(&:name)
    affiliation_names.should include("Cyrus")
    affiliation_names.should include("Nerf Herders")
  end

  it "reuses existing affiliations when creating new members" do
    existing_affiliation = Affiliation.create! :name => "Cyrus"
    post :create, {
        :member => {:name => "Jim"},
        :affiliation_list => "Cyrus, Nerf Herders"
    }
    response.should render_template("create")
    member = Member.last
    member.affiliations.first.should == existing_affiliation
  end

  it "can create a new member with no affiliations" do
    post :create, {:member => {:name => "Jim"}}
    Member.last.affiliations.should == []
  end

end
