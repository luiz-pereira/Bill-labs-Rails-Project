class Admin::StaticController < Admin::BaseController

	def home
		current_user ? redirect_to(admin_user_path(current_user)) : redirect_to(admin_login_path)
	end

end
