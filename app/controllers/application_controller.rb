class ApplicationController < ActionController::Base

  before_action :logged_in?

  def logged_in?
    !current_user.nil?
  end

  def is_admin?
    current_user && current_user.role.eql?("admin")
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if !session[:user_id].nil?
  end

end
