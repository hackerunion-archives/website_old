require 'spec_helper'

describe Member do

  it "is pending (not approved) by default" do
    name = "Jim"
    m = FactoryGirl.create :member, name: name
    m.name.should eq name
    m.approved.should be_false
  end

  it "has many affiliations" do
    m = FactoryGirl.create :member, name: "Jim"
    a = m.affiliations.build
    a.name = "Cyrus"
    m.save!
    m.affiliations.first.name.should eq "Cyrus"
  end

  it "provides a mechanism for approving pending members" do
    m = FactoryGirl.create :member, name: "Jim"
    m.approve!
    m.approved.should be_true
  end

end
