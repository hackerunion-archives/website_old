class MembersController < ApplicationController

  def index
    @members = Member.where(:pending => false)
  end

  def pending
    @members = Member.where(:pending => true)
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

private

  def parse_affiliation_list affiliations
    affiliations ||= ""
    affiliations.split(/\s*,\s*/)
  end

end
