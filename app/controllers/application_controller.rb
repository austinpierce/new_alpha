class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # methods in this controller are available to controllers but not views by default
  
  helper_method :current_user, :logged_in? # this makes available to views
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # return user if session user_id is in DB
    # return @current_user if already set, if not find the user and set current_user
  end
  
  def logged_in?
    !!current_user
    # returns true or false. Bang bang (!!)
    # true or false is the current_user logged in
  end
  
  def require_user
    if !nlogged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end
