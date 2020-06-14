class UsersController < ApplicationController

	skip_before_action :authorized, only: [:new, :create]

	def new
		@user = User.new
  	end

	def create
	  	@user = User.create(params.require(:user).permit(:username,        
	  		:password))
	  	if @user.save
	  		session[:user_id] = @user.id
	  		redirect_to '/login'
	  	else
	  		session[:user_id] = @user.id
	  		redirect_to '/welcome'
	  	end
 	end

 	def logout
 		session[:user_id] = nil
 		redirect_to '/welcome'
 	end
end
