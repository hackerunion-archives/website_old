class EventsController < ApplicationController
  before_filter :authenticate_member!, :only => [:new, :create]
  respond_to :html

  def index
    @events = Event.approved

    respond_with @events
  end

  def show
    @event = Event.find(params[:id])

    respond_with @event
  end

  def new
    @event = Event.new
    respond_with @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.approved = false
    @event.member = current_member

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render action: "new", alert: 'Event not successfully created.'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

  def pending
    @events = Event.not_approved
    respond_with @events
  end

  def approve
    @event = Event.find(params[:id])
    @event.approve!
    redirect_to pending_events_path, alert: "'#{@event.title}' successfully approved"
  end
end
