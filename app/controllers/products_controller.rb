class ProductsController < ApplicationController

	def index
		@page_title = "募資商品"
		@products_1 = Product.where(:is_public => true).order('due_date').limit(5)
		@products_2 = Product.where(:is_public => true).order('progress desc')-Product.where(:is_public => true).order('due_date').limit(5)
	end

	def show 
		@page_title = "商品細節"
		@product = Product.find(params[:id])
	end

end
