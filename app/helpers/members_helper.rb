module MembersHelper

  def comma_list_of_affiliations_for member
    return if member.affiliations.nil?
    member.affiliations.collect(&:name).join(', ')
  end

  def comma_list_of_skills_for member
    return if member.skills.nil?
    member.skills.collect(&:name).join(', ')
  end

  def affiliations_list_for member
    return if member.affiliations.nil?
    links = member.affiliations.map do |a|
      %Q{<a href="/members?q[affiliations_name_cont]=#{a.name}" class="affiliation" data-search="#{a.name}">#{a.name}</a>}
    end
    raw links.join(', ')
  end

  def skills_list_for member
    return if member.skills.nil?
    links = member.skills.map do |s|
      %Q{<a href="/members?q[skills_name_cont]=#{s.name}" class="skills" data-search="#{s.name}">#{s.name}</a>}
    end
    raw links.join(', ')
  end

  def toggle_ambassador_button id
    if current_member.admin?
      button_to('Toggle Ambassador Status', toggle_ambassador_member_path(id), method: 'put', class: 'btn btn-primary')
    end
  end

  def toggle_admin_button id
    if current_member.admin?
      button_to('Toggle Admin Status', toggle_admin_member_path(id), method: 'put', class: 'btn btn-primary')
    end
  end

end