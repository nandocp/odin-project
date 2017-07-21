class UsersController < ApplicationController
	def index # GET
		@name = "Index action here! I display all your content"
	end

	def new # GET
		@name = "New action here! I create new resources"
	end

	def edit # GET
		@name = "Edit action here! I edit your resources"
	end

	def show # GET
		@name = "Show action here! I show one of your resources"
	end

	def create # POST
		@user = User.new
		@user.save
	end
end
