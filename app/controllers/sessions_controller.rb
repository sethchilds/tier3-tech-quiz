class SessionsController < ApplicationController

  skip_before_action :logged_in?, only: [:home, :login, :create]

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to orders_path
    else
      message = "Username or password invalid"
      redirect_to login_path, notice: message
    end
  end

  def destroy
    @current_user = nil
    redirect_to login_path notice: "Successfully logged out"
  end

end
