class Admin::RequestsController < Admin::BaseController
	before_action :is_admin_signed_in?

	def new
		redirect_to login_path if (!current_user || params[:user_id] != current_user.username)

		@user = current_user
		@request = Request.new
	end

	def create
		redirect_to login_path if (!current_user || params[:user_id] != current_user.username)
		@user = current_user
		@request = @user.owned_requests.build
		@request.status = Status.find_by status: 'New'
		@request.company = @user.company
		@request.product = Product.find_by name: params[:product]
		@request.logs.build ({content: 'Request created'})
		@user.save

		redirect_to user_path(@user)
	end

end
