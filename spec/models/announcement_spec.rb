require 'spec_helper'

describe Announcement do

  it 'should give us the last 5 announcements' do
    now = DateTime.now
    e1 = FactoryGirl.create :announcement, created_at: now - 2.hour, approved: true
    e2 = FactoryGirl.create :announcement, created_at: now - 3.hour, approved: true
    e3 = FactoryGirl.create :announcement, created_at: now - 1.hour, approved: true
    e4 = FactoryGirl.create :announcement, created_at: now - 6.hour, approved: true
    e5 = FactoryGirl.create :announcement, created_at: now - 4.hour, approved: true
    e6 = FactoryGirl.create :announcement, created_at: now - 5.hour, approved: false

    Announcement.latest(5).should eq [e3, e1, e2, e5, e4]
  end

end
