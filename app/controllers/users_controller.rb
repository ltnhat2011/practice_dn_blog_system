class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :load_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  def show
  end
  # Show All Users
  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to the Blog App!"
      redirect_back_or @user
    else
      render :new
    end
  end

  def edit; end
  # Post Update User
  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:danger] = "Something went wrong"
      render :edit
    end
  end
  def destroy
    if @user.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "User don't not find"
    end
    redirect_to users_url
  end

  private
  # Verify Admin
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  def user_params
    params.require(:user).permit(:name, :email,
    :password, :password_confirmation)
  end
  # Confirms the correct user.
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
  # Find User by Id
  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = "User don't exists"
    redirect_to root_path
  end
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = "Please login"
    redirect_to login_path
  end

end
