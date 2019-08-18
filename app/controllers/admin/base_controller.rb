class Admin::BaseController < ApplicationController

	layout 'admin'


	def is_admin_signed_in?
		redirect_to admin_login_path unless (current_user && current_user.is_admin?)
	end

end