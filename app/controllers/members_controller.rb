class MembersController < ApplicationController

  def index
    @members = Member.where(:pending => false)
  end

  def new
    @member = Member.new
  end

  def create
    Member.transaction do
      @member = Member.create! params[:member]
      affiliation_names = parse_affiliation_list(params[:affiliation_list])
      affiliation_names.each do |affiliation_name|
        affiliation = Affiliation.find_or_create_by_name affiliation_name
        @member.affiliations << affiliation
      end
    end
  end

private

  def parse_affiliation_list affiliations
    affiliations ||= ""
    affiliations.split(/\s*,\s*/)
  end

end
