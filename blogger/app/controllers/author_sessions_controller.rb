class AuthorSessionsController < ApplicationController

	def new # responsible for rendering its related form
	end

	def create # responsible for accepting the submission of the form created
		if login(params[:email], params[:password])
			redirect_back_or_to(articles_path, notice: 'Logged in successfully')
		else
			flash.now.alert = "Login failed"
			render action: :new
		end
	end

	def destroy # responsible for removing a record of the appropriate type
		logout
		redirect_to(:authors, notice: 'Logged out')
	end
end
