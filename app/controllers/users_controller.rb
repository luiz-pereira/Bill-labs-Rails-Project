class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new (user_params)
		@user.username = @user.create_username
		@user.role = Role.find_by role: 'customer_admin'
		if @user.valid?
			@company = Company.find_or_create_by name: params[:user][:company][:name]
			@user.company = @company
			@user.save
			redirect_to user_path(@user)
		else
			render new_user_path
		end
	end

	def show
		unless current_user
			redirect_to login_path
		end
	end

private
	def user_params
		params.require(:user).permit(:name, :email, :position, :phone, :password)
	end


end
