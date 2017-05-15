class ProjectsController < ApplicationController

	def index
		@page_title = "專案"
		@projects = Project.where(:is_public => true).page(params[:page]).per(4)
		
	end

	def show 
		@page_title = "專案細節"
		@project = Project.find(params[:id])
		@days = (@project.due_date - Date.today).to_i
		@people = @project.donations.count
		@photos = @project.photos
		@photos_count = @photos.count
		@progress = @project.progress.round(0)
	end

end
