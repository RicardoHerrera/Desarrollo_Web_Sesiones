class SessionsController < ApplicationController
	skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def create
  	@user = User.find_by(username: params[:username])
   	if @user && @user.authenticate(params[:password])
    	session[:user_id] = @user.id
     	redirect_to '/authorized'
   	else
   		puts "Loggin failed #{params[:username]} - #{params[:password]}"
   		flash[:login_errors] = ['invalid credentials']
     	redirect_to '/login'
   	end
  end

  def welcome
  end

  def page_requires_login
    @users_list = User.all
  end
end
