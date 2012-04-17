require 'spec_helper'

describe MembersController do

  def valid_attributes
    {email: "Iexist@really.com",
     password: "Tryme4size"}
  end

  it "lists all approved members" do
    m1 = FactoryGirl.create :member, :name => "Jim", :pending => false
    m2 = FactoryGirl.create :member, :name => "Aldric", :pending => false
    get :index
    assigns[:members].first.name.should == "Jim"
    assigns[:members].last.name.should == "Aldric"
    response.should render_template("index")
  end

  it "excludes pending members from member list" do
    m1 = FactoryGirl.create :member, :name => "Jim"
    m2 = FactoryGirl.create :member, :name => "Aldric", :pending => false
    get :pending
    members = assigns[:members]
    members.size.should == 1
    assigns[:members].first.name.should == "Jim"
    response.should render_template("pending")
  end

  it "lists pending members" do
    m1 = FactoryGirl.create :member, :name => "Jim"
    m2 = FactoryGirl.create :member, :name => "Aldric", :pending => false
    get :pending
    members = assigns[:members]
    members.size.should == 1
    assigns[:members].first.name.should == "Jim"
  end

  it "can approve a pending member" do
    m = FactoryGirl.create :member, name: "Jim"
    put :approve, {id: m}
    assigns[:member].name.should eq "Jim"
    m.reload
    m.pending.should be_false
  end

  it "can add affiliations" do
    m = FactoryGirl.create :member, name: "Jim"
    put :update, {id: m,
                  affiliations: "HackerUnion, CyrusInnovation",
                  name: "Bob"}

    assigns[:member].affiliations.size.should eq 2
    assigns[:member].name.should eq "Bob"
  end

  context "Logged in, approved member" do

    before :each do
      @user = FactoryGirl.create :member, pending: false
      sign_in @user
    end

    it "can see the members directory" do
      get :index
      response.should_not redirect_to 'home#index'
    end
  end


  context "Logged in, pending member" do

    before :each do
      @user = FactoryGirl.create :member, pending: true
      sign_in @user
    end

    it "cannot see the members directory" do
      get :index
      response.should redirect_to root_path
    end
  end

end
