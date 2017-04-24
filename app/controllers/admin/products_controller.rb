class Admin::ProductsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	before_action :find_product, only:[:show,:edit, :update, :destroy]
	layout "admin"

	def index 
		@products = Product.all

	end

	def show 

	end

	def new
		@product = Product.new
		5.times {@photos = @product.photos.build}

	end

	def create
		@product = Product.new(product_params)	
		
		if @product.save
			respond_to do |format|
				  format.html { redirect_to admin_product_path(@product)}
				  format.js	
				  
			end		
		else 
			render :new
		end
	end

	def edit 
		a = @product.photos.count
		b = 5-a
		b.times {@photos = @product.photos.build}
	end

	def update
		if @product.update(product_params)		
			
			respond_to do |format|
				  format.html { redirect_to admin_product_path(@product)}
				  format.js
			end		
		else 
			render :edit
		end
	end


	def destroy 
		@product.destroy
		redirect_to admin_products_path
	end




	protected 
	def check_admin 
		unless current_user.role == "admin"
			raise ActiveRecord::RecordNotFound			
		end
	end
	def find_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:due_date,:name,:is_public,:description,:unit,:unit_price,:cost,:cost_detail,:donation_file ,:npo_id, :photos_attributes => [:id, :image, :_destroy])
	end



end
