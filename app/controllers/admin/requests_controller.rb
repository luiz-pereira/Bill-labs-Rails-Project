class Admin::RequestsController < Admin::BaseController
	before_action :is_admin_signed_in?

	def index
		@user = current_user
		@companies = Company.all
		case @user.role.role
		when 'admin_analyst'
			@requests = @user.analyzed_requests
		else
			@requests = Request.all
		end
	end

	def update
		@request = Request.find(params[:id])
		if params[:analyst]
			@request.analyst = User.find(params[:analyst])
		end
		if params[:status]
			case params[:status]
			when 'advance'
				@request.status = Status.find(@request.status.next_status_id)
			when 'back'
				@request.status = Status.find(@request.status.previous_status_id)
			end
		end
		@request.save
		redirect_to admin_user_requests_path(current_user)
	end

end
