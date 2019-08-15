class SessionController < ApplicationController

	def new
		logout!
	end

	def create
		if auth
			@user = User.find_or_create_user_linkedin(auth)
		else
			unless found_user? && @user.authenticate(params[:session][:password])
				flash[:alert] = "User not found. To create a new account, please 'Sign up'"
				render '/session/new'
			end
		end
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def destroy
		session.clear
		redirect_to root_path
	end

private

	def auth
		request.env['omniauth.auth']
	end

	def found_user?
		auth ? (@user = User.find_by email: auth[:info][:email]) : (@user = User.find_by email: params[:session][:email])
	end

end
