class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Rails Tutorial App!"
  		redirect_to user_url(@user) # or just redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
	  def user_params
	  	params.require(:user).permit(:name,
	  															 :email,
	  															 :password,
	  															 :password_confirmation)
	  end
end
