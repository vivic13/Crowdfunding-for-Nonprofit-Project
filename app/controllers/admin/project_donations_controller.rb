class Admin::ProjectDonationsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	
	def index 
		@project = Project.find(params[:project_id])
		@donations = @project.donations
	end

	private

	def check_admin 
		unless current_user.role == "admin"
			raise ActiveRecord::RecordNotFound			
		end
	end


end
