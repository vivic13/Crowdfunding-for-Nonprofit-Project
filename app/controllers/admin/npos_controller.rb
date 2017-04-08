class Admin::NposController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	before_action :find_npo, only:[ :edit,:update, :destroy]
	layout "admin"

	def index 
		@npos = Npo.all

	end

	def create 
		@npo = Npo.new(npo_params)

		if @npo.save
			
			respond_to do |format|
				  format.html { redirect_to admin_npos_path}
	
			end		
		else 
			render :index
		end

	end

	def edit

	end
	def update 
		if @npo.update(npo_params)
			
			respond_to do |format|
				  format.html { redirect_to admin_npos_path}
		
			end		
		else 
			render :index
		end

	end 

	def destroy 
		@npo.destroy
		redirect_to admin_npos_path
	end



	protected
		def check_admin 
			unless current_user.role == "admin"
				raise ActiveRecord::RecordNotFound			
			end
		end
		def find_npo
			@npo = Npo.find(params[:id])
		end

		def npo_params
			params.require(:npo).permit(:name,:code, :philosophy)
		end
end
