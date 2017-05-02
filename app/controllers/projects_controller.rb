class ProjectsController < ApplicationController

	def index
		@page_title = "募資專案"
		@projects = Project.where(:is_public => true)
		
	end

	def show 
		@page_title = "專案細節"
		@project = Project.find(params[:id])
	end

end
