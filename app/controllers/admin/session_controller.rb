class Admin::SessionController < Admin::BaseController

	def new
		logout!
	end

	def create
		unless found_user? && @user.is_admin? && @user.authenticate(params[:session][:password])
			flash[:alert] = "Admin not found with this e-mail/password. Please check"
			render '/session/new'
		end
		session[:user_id] = @user.id
		redirect_to admin_user_path(@user)
	end

	def destroy
		session.clear
		redirect_to root_path
	end

private

	def found_user?
		@user = User.find_by email: params[:session][:email]
	end

end
