class SessionsController < ApplicationController
	def new
	end

	# cria a sessão do membro
	def create
		# passo 1: achar o membro pelo e-mail
		member = Member.find_by(email: params[:session][:email].downcase)
		# passo 2: comparar com o password guardado no db
  	if member && member.authenticate(params[:session][:password])
  		log_in member
  		redirect_to member # OU member_url(member)
  	else
  		render 'new'
  	end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end
