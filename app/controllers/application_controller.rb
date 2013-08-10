class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    @current_user ||= get_current_user
  end

  def get_current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_login
      redirect_to new_session_url unless logged_in?
  end

end
