class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :check_activity

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    return if current_user
      redirect_back(fallback_location: api_v0_search_path)
      flash[:error] = "You must be logged in or registered to create a deck."
  end

  def check_activity
    if current_user && session[:last_activity] && session[:last_activity] < 30.minutes.ago
      reset_session
      flash[:notice] = "You have been logged out due to inactivity."
      redirect_to login_path
    else
      session[:last_activity] = Time.current
    end
  end
end
