class FriendshipsController < ApplicationController
	def create
		@friendship = User.find(session[:user_id]).friendships.create(friend_id:params[:id])
		redirect_to :back
	end
	def delete
		Friendship.where(user_id:session[:user_id], friend_id:params[:id]).take.destroy
		redirect_to :back
	end
	def update
		Friendship.find(params[:id]).update(status:true)
		redirect_to :back
	end
	def destroy
		Friendship.find(params[:id]).destroy
		redirect_to :back
	end
end
