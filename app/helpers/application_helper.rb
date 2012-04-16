module ApplicationHelper

  def login_or_logout_link
    if member_signed_in?
      link_to "Logout", destroy_member_session_path, :method => :delete
    else
      link_to "Login", new_member_session_path
    end
  end

end
