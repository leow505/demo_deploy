class UsersController < ApplicationController
  def index
  	@current_user = User.find(session[:user_id])
  	@friends = @current_user.friends
  	@invitation = Friendship.where(session[:user_id]).joins(:user).select('users.name',:id, 'users.id as user_id').where(status:false)
  end

  def all
  	@users = User.where.not(id:session[:user_id])
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
		newuser = User.create(user_params)
	  	if newuser.save
	  		flash[:success] = 'Successfully registered, login to continue'
	  		redirect_to :back
	  	else
	  		flash[:message] = newuser.errors.full_messages
	  		redirect_to :back
	  	end
	end
  private
	  def user_params
	  	params.require(:user).permit(:name, :description, :email, :password, :password_confirmation)
	  end
end
