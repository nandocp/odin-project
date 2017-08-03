class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      # ternary = boolean? ? do_one_thing : do_something_else
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
  		redirect_to user # redirect_to user_url(user)
  	else
  		flash.now[:danger] = 'Invalid email/password'
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
