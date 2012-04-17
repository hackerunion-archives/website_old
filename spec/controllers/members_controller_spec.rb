require 'spec_helper'

describe MembersController do

  def valid_attributes
    {email: "Iexist@really.com",
     password: "Tryme4size"}
  end

  context "Logged in administrator" do

    before :each do
      @user = FactoryGirl.create :member, admin: true, approved: true
      sign_in @user
    end

    it "lists pending members" do
      m1 = FactoryGirl.create :member, :name => "Jim"
      m2 = FactoryGirl.create :member, :name => "Aldric", approved: true
      get :pending
      members = assigns[:members]
      members.size.should eq 1
      assigns[:members].first.name.should eq "Jim"
    end

    it "can approve a pending member" do
      m = FactoryGirl.create :member, name: "Jim"
      put :approve, {id: m}
      assigns[:member].name.should eq "Jim"
      m.reload
      m.approved.should be_true
    end
  end

  context "Logged in, approved member" do

    before :each do
      @user = FactoryGirl.create :member, approved: true
      sign_in @user
    end

    it "can see the members directory" do
      get :index
      response.should_not redirect_to 'home#index'
    end

    it "lists all approved members" do
      m1 = FactoryGirl.create :member, :name => "Jim", approved: true
      m2 = FactoryGirl.create :member, :name => "Aldric", approved: true
      get :index
      assigns(:members).map(&:name).sort.should eq ['Test User', 'Jim', 'Aldric'].sort
      response.should render_template("index")
    end

    it "can add affiliations to himself" do
      #m = FactoryGirl.create :member, name: "Jim", approved: true
      put :update, {id: @user.id,
                    affiliations: "HackerUnion, CyrusInnovation",
                    name: "Bob"}
      @user.reload
      @user.name.should eq 'Bob'
      @user.affiliations.size.should eq 2
    end

    it "excludes pending members from member list" do
      m1 = FactoryGirl.create :member, :name => "Jim"
      m2 = FactoryGirl.create :member, :name => "Aldric", approved: true
      get :index
      members = assigns[:members]
      members.size.should eq 2
      members.last.name.should eq "Aldric"
      response.should render_template("index")
    end

  end

  context "Logged in, pending member" do

    before :each do
      @user = FactoryGirl.create :member, approved: false
      sign_in @user
    end

    it "cannot see the members directory" do
      get :index
      response.should redirect_to root_path
    end
  end

  context "Logged out" do

    it "cannot see the members directory" do
      get :index
      response.should redirect_to new_member_session_path
    end
  end

end
