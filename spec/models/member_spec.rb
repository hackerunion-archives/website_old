require 'spec_helper'

describe Member do

  it "models a member" do
    name = "Jim"
    m = Member.create! :name => name
    m.name.should == name
  end

end
