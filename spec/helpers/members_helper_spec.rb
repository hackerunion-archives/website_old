require 'spec_helper'

describe MembersHelper do

  it "creates a commalist of affiliation names" do
    m = Member.new :name => "Jim"
    a1 = m.affiliations.build
    a1.name = "Cyrus"
    a2 = m.affiliations.build
    a2.name = "Something Else"

    affiliations_list_for(m).should == "Cyrus, Something Else"
  end

end