class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    cookies[:auth_token] = {
      value: user.auth_token,
      expires: 30.days.from_now
    }
    uri = session[:referer]
    session[:referer] = nil
    if current_user.families.count < 1
      redirect_path = new_family_path
    else
      redirect_path = root_path
    end
    redirect_path = uri if uri
    redirect_to redirect_path
  end

  def destroy
    cookies.delete :auth_token
    redirect_to sign_in_path
  end
end
