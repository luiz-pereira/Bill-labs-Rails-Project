class SessionController < ApplicationController

	def new
	end

	def create
		@user = User.find_by email: params[:session][:email]
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:alert] = "User/password doesn't match any records. Please check."
			render '/session/new'
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end

end
