module MembersHelper

  def affiliations_list_for member
    member.affiliations.collect(&:name).join(", ")
  end

  def toggle_ambassador_button id
    if current_member.admin?
      button_to('Toggle Ambassador Status', toggle_ambassador_member_path(id), method: 'put')
    end
  end

end