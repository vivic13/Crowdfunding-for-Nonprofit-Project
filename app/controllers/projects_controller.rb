class ProjectsController < ApplicationController

	def index
		@page_title = "募資專案"
		@projects = Project.where(:is_public => true)
		
	end

	def show 
		@page_title = "專案細節"
		@project = Project.find(params[:id])
		@people = @project.donations.count
		@photos = @project.photos
		@photos_count = @photos.count
		@progress = @project.progress.round(0)
	end

end
