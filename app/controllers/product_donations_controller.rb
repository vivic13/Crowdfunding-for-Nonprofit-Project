class ProductDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_product

	def new 
		@donation = @product.donations.build
	end 

	def create 
		@donation = @product.donations.build(donation_params)
		@donation.user_id = current_user.id

		if @donation.save		
			redirect_to product_donation_path(@product,@donation)
		else
			render :new
		end

	end


	def show 
		@donation = @product.donations.find(params[:id])
	end 

	protected 

	def find_product
		@product = Product.find(params[:product_id])
	end

	def donation_params
		params.require(:donation).permit(:unit,:status, :payment_status,:lottery_number)
	end

	
end
