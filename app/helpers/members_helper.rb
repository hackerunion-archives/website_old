module MembersHelper

  def affiliations_list_for member
    unless member.affiliations.nil?
      Rails.logger.info "---------------------------------"
      Rails.logger.info member.email
      Rails.logger.info member.affiliations.inspect
      Rails.logger.info "---------------------------------"
      member.affiliations.collect(&:name).join(", ")
    end
  end

  def skills_list_for member
    unless member.skills.nil?
      member.skills.collect(&:name).join(", ")
    end
  end

  def toggle_ambassador_button id
    if current_member.admin?
      button_to('Toggle Ambassador Status', toggle_ambassador_member_path(id), method: 'put')
    end
  end

end