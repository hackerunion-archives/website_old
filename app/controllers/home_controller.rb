class HomeController < ApplicationController
  def index
  	redirect_to '/members/sign_up' #unless member_signed_in?
    @events = Event.upcoming(2)
    @announcements = Announcement.latest(5)
  end
end
