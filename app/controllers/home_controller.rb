class HomeController < ApplicationController
  def index
    @events = Event.upcoming(2)
    @announcements = Announcement.latest(5)
  end
end
