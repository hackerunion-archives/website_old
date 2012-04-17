module ApplicationHelper

  def login_or_logout_link
    if member_signed_in?
      link_to "Logout", destroy_member_session_path, :method => :delete
    else
      link_to "Login", new_member_session_path
    end
  end

  def pending_link
    link_to('Pending Members', pending_members_path) if (current_member && current_member.admin?)
  end

end
