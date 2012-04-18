class MembersController < ApplicationController

  before_filter :authenticate_member!, :only => [:index]
  load_and_authorize_resource

  def index
    @q = Member.search params[:q]
    if params[:ambassador] == '0' # Find out if checkbox is checked
      @q = @q.result.search(:ambassador_eq => true)
    end
    @members = @q.result.where(:approved => true)
  end

  def pending
    @members = Member.where(:approved => false)
  end

  def approve
    @member = Member.find(params[:id])
    @member.approve!
  end

  def show
    @member = Member.find params[:id]
  end

  def edit
    @member = Member.find params[:id]
  end

  def update
    @member = Member.find params[:id]
    @member.update_attribute(:name, params[:name])
    parse_affiliation_list(params[:affiliations]).each do |a|
      @member.affiliations << Affiliation.find_or_create_by_name(a)
    end
    @member.save!
    redirect_to members_path
  end

  def toggle_ambassador
    m = Member.find(params[:id])
    m.ambassador = !m.ambassador?
    m.save!
    redirect_to member_path(m.id)
  end

private

  def approved_member?
    redirect_to root_path unless current_member.approved?
  end

  def parse_affiliation_list affiliations
    affiliations ||= ""
    affiliations.split(/\s*,\s*/)
  end

end
