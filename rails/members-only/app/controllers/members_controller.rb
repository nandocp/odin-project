class MembersController < ApplicationController

	def new # inicia um novo usuário
		@member = Member.new
	end

	def create
		@member = Member.new(member_params)
		if @member.save
			log_in @member
			redirect_to members_path
		else
			render 'new'
		end
	end

	def show
		@member = Member.find(params[:id])
	end

	private
		def member_params
			params.require(:member).permit(:name,
																		 :email,
																		 :password,
																		 :password_confirmation)
		end
end