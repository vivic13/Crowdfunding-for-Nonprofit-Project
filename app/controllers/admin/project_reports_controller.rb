class Admin::ProjectReportsController < ApplicationController
	before_action :find_project
	def new
    @report = @project.build_report
  end

  protected

  def find_project
    @project = Project.find( params[:project_id] )
  end
  
  def location_params
    params.require(:location).permit(:name)
  end
 
end
