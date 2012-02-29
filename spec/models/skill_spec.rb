require 'spec_helper'

describe Skill do

    it "models a skill" do
      name = "Ruby"
      s = Skill.create! :name => name
      s.name.should == name
    end

end
