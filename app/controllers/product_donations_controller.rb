class ProductDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_product

	def new 
		@page_title = "參與募資"
		@donation = @product.donations.build
	end 

	def create 
		if @product.donation_unit_count == @product.unit || DateTime.now > @product.due_date
			redirect_to product_path(@product)
	 		flash[:alert] = "很可惜，已結束募資!"	
		else
			@donation = @product.donations.build(donation_params)
			@donation.user_id = current_user.id

			if @donation.save		
				redirect_to product_donation_path(@product,@donation)
			else
				render :new
			end
		end
	end


	def show 
		@page_title = "您的訂單資訊"
		@donation = @product.donations.find(params[:id])
		

			
	end 

	protected 

	def find_product
		@product = Product.find(params[:product_id])
	end

	def donation_params
		params.require(:donation).permit(:address,:unit,:status, :payment_status,:lottery_number)
	end

	
end
