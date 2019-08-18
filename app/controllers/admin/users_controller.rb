class Admin::UsersController < Admin::BaseController
	before_action :is_admin_signed_in?

	def new
		logout!
		@user = User.new
	end

	def show
		unless current_user
			redirect_to admin_login_path
		end

		@user = current_user

		case @user.role.role
		when 'admin_analyst'
			redirect_to admin_user_requests_path(@user)
		when 'admin_master'
			redirect_to admin_user_requests_path(@user)
		when 'admin_owner'
			redirect_to admin_users_path
		end
	end

	def index
		@roles_admin = Role.where("role LIKE ?", "admin%").map(&:id)
		@users = User.where(role_id: [@roles_admin])
	end

end
