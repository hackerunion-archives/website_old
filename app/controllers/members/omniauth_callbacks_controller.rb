class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @member = Member.find_for_github_oauth(request.env["omniauth.auth"], current_member)
    return render_403 if @member.nil?

    if @member.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Github"
      sign_in_and_redirect @member, :event => :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_url
    end
  end
end