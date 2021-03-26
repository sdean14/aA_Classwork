class ApplicationController < ActionController::Base

  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def require_logged_in
    redirect_to cats_url if !current_user.nil?
  end
  
end
