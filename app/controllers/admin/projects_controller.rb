class Admin::ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
	before_action :find_project, only:[:show,:edit, :update, :destroy]
	layout "admin"

	def index 
		@projects = Project.all
	end

	def show 

	end

	def new
		@project = Project.new
		@stories = Story.where(need_project: "yes")
		5.times {@photos = @project.photos.build}
		

	end

	def create
		@project = Project.new(project_params)	
		@stories = Story.where(need_project: "yes")
		if @project.save
			respond_to do |format|
				  format.html { redirect_to admin_project_path(@project)}
				  format.js	
				  
			end		
		else 
			render :new
		end
	end

	def edit 
		@stories = Story.where(need_project: true)
		a = @project.photos.count
		b = 5-a
		b.times {@photos = @project.photos.build}
	end

	def update
		if @project.update(project_params)		
			
			respond_to do |format|
				  format.html { redirect_to admin_project_path(@project)}
				  format.js
			end		
		else 
			render :edit
		end
	end


	def destroy 
		@project.destroy
		redirect_to admin_projects_path
	end
    


	protected 
	def check_admin 
		unless current_user.role == "admin"
			raise ActiveRecord::RecordNotFound			
		end
	end
	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:due_date,:name,:content,
			                            :is_public,:total_amount, 
			                            :story_id,
			                            :photos_attributes => [:id, :image, :_destroy],
			                            :report_attributes => [:id, :name, :_destroy] 
			                            )
	end



end
