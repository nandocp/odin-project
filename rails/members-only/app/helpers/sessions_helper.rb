# código para implementar as sessões
module SessionsHelper
	
	def log_in(member)
		remember_token = Member.new_token
		session[:member_id] = member.id
		cookies.permanent[:remember_token] = member.remember_token
		self.current_member = member
	end

	def current_member=(member)
		@current_member = member
	end

	# verifica se existe algum membro logado numa sessão e passa para as páginas subsequentes
	def current_member
		remember_token = Member.digest(cookies[:remember_token])
		@current_member ||= Member.find_by(id: session[:member_id])
	end

	# verifica se existe algum 'member' logado. True se tiver, False se não
	def logged_in?
		!current_member.nil?
	end

	def log_out
		session.delete(:member_id)
		self.current_member = nil
	end
end