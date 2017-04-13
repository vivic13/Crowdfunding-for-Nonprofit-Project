class ProductsController < ApplicationController

	def index
		@products = Product.where(:is_public => true)
	end

	def show 
		@product = Product.find(params[:id])
		if @product.donation_unit_count > 0
			@progress = (@product.donation_unit_count.to_f/@product.unit)*100
		else
			@progress = 0
		
		end

	end



end
