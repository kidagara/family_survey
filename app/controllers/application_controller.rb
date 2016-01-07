class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate!
    unless current_user
      redirect_to sign_in_path
    end
  end
  helper_method :authenticate!

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.humanize(capitalize: false)
    flash[:error] = "The #{policy_name.underscore.humanize} prohibits you from performing #{exception.query} on #{exception.record}."
    redirect_to request.referrer || root_path
  end

end
