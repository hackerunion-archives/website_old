require 'spec_helper'

describe Event do

  before :all do
    # Are you as confused as we were?
    @now = DateTime.now #'2012-04-16 14:12:54'.to_datetime
    @tomorrow = @now + 1.day
  end

  it 'should have the end_date after the start_date' do
    e = FactoryGirl.build :event, starts: @now,
                          ends: @tomorrow
    e.should be_valid
    e = FactoryGirl.build :event, starts: @tomorrow,
                          ends: @now
    e.should_not be_valid
  end

  it 'should give us the next two upcoming events' do
    e1 = FactoryGirl.create :event, starts: @now + 2.hour, ends: @tomorrow
    e2 = FactoryGirl.create :event, starts: @now + 3.hour, ends: @tomorrow
    e3 = FactoryGirl.create :event, starts: @now + 1.hour, ends: @tomorrow

    Event.upcoming(2).should eq [e3, e1]
  end

end
