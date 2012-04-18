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

end
