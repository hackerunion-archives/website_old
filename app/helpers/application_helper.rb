module ApplicationHelper

  def login_or_logout_link
    if member_signed_in?
      link_to "Logout", destroy_member_session_path, :method => :delete
    else
      link_to "Login", new_member_session_path
    end
  end

  def sign_up_or_edit_profile_link
    if member_signed_in?
      link_to 'Edit profile', edit_member_registration_path
    else
      link_to 'Sign up', new_member_registration_path
    end
  end

  def pending_members_link
    link_to('Pending Members', pending_members_path) if (current_member && current_member.admin?)
  end

  def pending_events_link
    link_to('Pending Events', pending_events_path) if (current_member && current_member.admin?)
  end

  def action_buttons(resource)
    resource_name = resource.class.to_s.downcase
    buttons = ""
    return buttons unless current_member.admin?
    if resource.approved?
      buttons << link_to('Edit', send("edit_#{resource_name}_path", resource), class: 'btn btn-mini')
      buttons << link_to('Destroy', send("#{resource_name}_path", resource), :method => :delete, :confirm => 'Are you sure?', class: 'btn btn-mini btn-danger')
    else
      buttons << button_to( 'Approve', send("approve_#{resource_name}_path", resource), :method => 'put', class: 'btn btn-mini')
    end
    raw buttons
  end

end