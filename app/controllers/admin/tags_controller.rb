class Admin::TagsController < ApplicationController
	layout "admin"
	before_action :check_admin
	def index 
		@tags = Tag.all
	end

	
	def create

		@tag= Tag.new(permit_tag)
		if @tag.save
			redirect_to admin_tags_path
		else 
			render :index
		end

	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to admin_tags_path

	end

	private

	def permit_tag
		params.require(:tag).permit(:name)
	end

	def check_admin
    unless current_user.role == "admin"
    	raise ActiveRecord::RecordNotFound
    end      
  end



end
