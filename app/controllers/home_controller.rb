class HomeController < ApplicationController
  def index
    @events = Event.upcoming(2)
  end
end
