class Admin::ProductDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	
	def index 
		@product = Product.find(params[:product_id])
		@donations = @product.donations
	end

	private

	def check_admin 
		unless current_user.role == "admin"
			raise ActiveRecord::RecordNotFound			
		end
	end


end
