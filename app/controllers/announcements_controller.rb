class AnnouncementsController < ApplicationController
  before_filter :authenticate_member!, :only => [:new, :create]
  respond_to :html

  load_and_authorize_resource

  def index
    @announcements = Announcement.approved

    respond_with @announcements
  end

  def show
    @announcement = Announcement.find(params[:id])

    respond_with @announcement
  end

  def new
    @announcement = Announcement.new
    respond_with @announcement
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    @announcement.approved = false
    @announcement.member = current_member

    if @announcement.save
      redirect_to @announcement, notice: 'Announcement was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @announcement = Announcement.find(params[:id])

    if @announcement.update_attributes(params[:announcement])
      redirect_to @announcement, notice: 'Announcement was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to announcements_url
  end

  def pending
    @announcements = Announcement.not_approved
    respond_with @announcements
  end

  def approve
    @announcement = Announcement.find(params[:id])
    @announcement.approve!
    redirect_to pending_announcements_path
  end
end
