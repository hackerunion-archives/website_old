require 'spec_helper'

describe Member do

  it "models a member" do
    name = "Jim"
    m = Member.create! :name => name
    m.name.should == name
    m.pending.should == true
  end

  it "has many affiliations" do
    m = Member.create! :name => "Jim"
    a = m.affiliations.build
    a.name = "Cyrus"
    m.save!
    m.affiliations.first.name.should == "Cyrus"
  end

end
