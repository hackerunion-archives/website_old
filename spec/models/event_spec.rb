require 'spec_helper'

describe Event do

  before :all do
    # Are you as confused as we were?
    @today = Date.today
    @tomorrow = DateTime.tomorrow
  end

  it 'should have the end_date after the start_date' do
    e = FactoryGirl.build :event, starts: @today,
                          ends: @tomorrow
    e.should be_valid
    e = FactoryGirl.build :event, starts: @tomorrow,
                          ends: @today
    e.should_not be_valid
  end
end
