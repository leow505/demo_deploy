class SessionsController < ApplicationController
	before_action :log_user, only: :new
	def create
	u = User.find_by_email(params[:email])
		if (u && u.authenticate(params[:password]))
			session[:user_id] = u.id
			redirect_to '/profile'
		else
			flash[:errors] = 'Invalid login information'
			redirect_to :back
		end
	end
	def delete
		session.delete(:user_id)
		redirect_to '/'
	end
end
