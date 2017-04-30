class Admin::ProjectReportsController < ApplicationController
	before_action :find_project

	def show
    @report = @project.report
  end

	def new
    @report = @project.build_report
  end

  def create
    @report = @project.build_report( report_params )
    if @report.save
      redirect_to admin_project_report_url( @project )
    else
      render :action => :new
    end
  end

  def edit
    @report = @project.report
  end

  def update
    @report = @project.report

    if @report.update( report_params )
      redirect_to admin_project_report_url( @project )
    else
      render :action => :edit
    end

  end

  def destroy
    @report = @project.report
    @report.destroy

    redirect_to admin_project_report_url( @project )
  end


  protected

  def find_project
    @project = Project.find( params[:project_id] )
  end
  
  def report_params
    params.require(:report).permit(:title, :content, :project_id)
  end
 
end
