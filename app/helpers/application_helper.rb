module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if !!session[:user_id]
  end

  def logged_in?
    unless current_user
      redirect_to root_url
   end
  end

  def is_admin?
    current_user && current_user.role.eql?("admin")
  end

end
