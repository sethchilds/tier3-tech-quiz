class UsersController < ApplicationController

  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: [:new, :create, :destroy]


  # GET /users or /users.json
  def index
    redirect_to(controller: "users", action: "show", id: session[:user_id]) if !is_admin?

    #Remove this username from the list of users
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

     # Only allow admins to perform certain actions
    def require_admin
      redirect_to root_path, notice: "Access denied" unless is_admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      unless is_admin? || @user.id == session[:user_id]
        redirect_to root_path, notice: "Access denied"
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      permitted = [:username, :password, :address]
      permitted << :role if is_admin? # Only admins can set/change role
      params.require(:user).permit(permitted)
    end
end
