module MembersHelper

  def affiliations_list_for member
    unless member.affiliations.nil?
      member.affiliations.collect(&:name).join(", ")
    end
  end

  def toggle_ambassador_button id
    if current_member.admin?
      button_to('Toggle Ambassador Status', toggle_ambassador_member_path(id), method: 'put')
    end
  end

end