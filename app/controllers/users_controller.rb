class UsersController < ApplicationController
  before_filter :correct_user, only: [:edit, :update, :account]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @result = UserSignup.new(@user).sign_up(params[:invitation_token])

    if @result.successful?
      flash[:success] = "Thank you for signing up!"
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:danger] = @result.error_message
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "You have successfully edited Your Account"
      redirect_to edit_user_path
    else
      flash[:danger] = "Something Went Wrong! Your account wasn't edited properly"
      render :edit
    end 
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to videos_path
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_column(:admin, true)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :admin, :main_contact_first_name, :main_contact_last_name, :company_name, :phonenumber, :password, :address_one, :address_two, :city, :state, :postcode)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to home_path unless current_user == @user
  end
end
