require 'spec_helper'

describe Affiliation do

    it "models an affiliation" do
      name = "Cyrus"
      a = Affiliation.create! :name => name
      a.name.should == name
    end

    it "has many members" do
      a = Affiliation.create! :name => "Cyrus"
      m = a.members.build
      m.name = "Jim"
      a.save!
      a.members.first.name.should == "Jim"
    end

end
