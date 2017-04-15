class ProductsController < ApplicationController

	def index
		@products_1 = Product.where(:is_public => true).order('due_date').limit(5)
		@products_2 = Product.where(:is_public => true).order('progress desc')-Product.where(:is_public => true).order('due_date').limit(5)





	end

	def show 
		@product = Product.find(params[:id])
		
		

	end



end
