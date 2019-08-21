class ProductsController < ApplicationController

	def update
		@product = Product.find(params[:id])
		@product.market_price = params[:product][:market_price]
		@product.save
		redirect_to admin_user_requests_path(current_user)
	end

end
