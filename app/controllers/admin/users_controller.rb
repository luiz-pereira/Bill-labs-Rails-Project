class Admin::UsersController < Admin::BaseController
	before_action :is_admin_signed_in?

	def new
		unless current_user && current_user.role.role == "admin_owner"
			logout!
			redirect_to admin_login_path
		end
		@admin_user = User.new
	end

	def create
		@admin_user = User.new (user_params)
		@admin_user.position = @admin_user.role.role.gsub('admin_', "").capitalize
		@admin_user.email = "#{@admin_user.username.downcase}@bill-labs.com"
		@admin_user.company = Company.find_by name: 'Bill-Labs'
		if @admin_user.save
			redirect_to admin_user_path(current_user)
		else
			render '/admin/users/new'
		end
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

	def edit
		binding.pry
	end

	def update
		if params[:controller] == "admin/users"
			@target_user = User.find_by username: params[:id]
			@target_user.active ? (@target_user.active = false) : (@target_user.active = true)
			@target_user.save
			redirect_to admin_user_path(current_user)
		end
	end


private

	def user_params
		params.require(:user).permit(:name, :username, :email, :position, :phone, :password, :role_id)
	end

end
