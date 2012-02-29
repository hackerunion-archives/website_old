require 'spec_helper'

describe Affiliation do

    it "models an affiliation" do
      name = "Cyrus"
      a = Affiliation.create! :name => name
      a.name.should == name
    end

end
