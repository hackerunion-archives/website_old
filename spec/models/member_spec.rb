require 'spec_helper'

describe Member do

  it "is pending (not approved) by default" do
    name = "Jim"
    m = FactoryGirl.create :member, name: name
    m.name.should eq name
    m.pending.should eq true
  end

  it "has many affiliations" do
    m = FactoryGirl.create :member, name: "Jim"
    a = m.affiliations.build
    a.name = "Cyrus"
    m.save!
    m.affiliations.first.name.should eq "Cyrus"
  end

  it "provides a mechanism for approving pending members" do
    m = FactoryGirl.create :member, :name => "Jim"
    m.approve!
    m.pending.should == false
  end

end
