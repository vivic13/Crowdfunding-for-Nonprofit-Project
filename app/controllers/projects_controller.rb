class ProjectsController < ApplicationController

	def index
		@page_title = "募資專案"
		@projects_1 = Project.where(:is_public => true).order('due_date').limit(5)
		@projects_2 = Project.where(:is_public => true).order('progress desc')-Project.where(:is_public => true).order('due_date').limit(5)
	end

	def show 
		@page_title = "專案細節"
		@project = Project.find(params[:id])
	end

end
