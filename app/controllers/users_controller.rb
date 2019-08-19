class UsersController < ApplicationController

	def new
		logout!
		@user = User.new
	end

	def create
		@user = User.new (user_params)
		@user.username = @user.create_username
		@user.role = Role.find_by role: 'customer_admin'
		if @user.valid?
			@company = Company.find_or_create_by name: params[:user][:company][:name], sector: Sector.find_by(sector: 'Telecommunications')
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
		@user = current_user
		@requests = @user.owned_requests
	end

private
	def user_params
		params.require(:user).permit(:name, :email, :position, :phone, :password)
	end


end
