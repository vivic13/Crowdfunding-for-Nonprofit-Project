class Admin::StoriesController < ApplicationController
	layout "admin"
	before_action :check_admin
	before_action :find_story, only:[:show,:edit, :update, :destroy]
	
	def home
		@stories_count = Story.all.count
		@stories_public = Story.where(:is_public => true).count
		@stories_private = @stories_count - @stories_public
		@projects_count = Project.all.count
		@project_public = Project.where(:is_public => true).count
		@projct_private = @projects_count - @project_public
		@users_count = User.where.not(:role => "admin").count
		@reports_count = Report.all.count
		@report_public = Report.where(:is_public => true).count
		@report_private = @reports_count - @report_public

	end

	def index 
		@stories = Story.all

	end

	def show 
		if @story.youtube_link.present?
			@link = "https://www.youtube.com/embed/" + @story.youtube_code + "?autoplay=0"
		end
	end

	def new
		@story = Story.new
		5.times {@photofiles = @story.photofiles.build}

	end

	def create
		@story = Story.new(story_params)	
			if current_user.role != "admin"
				@story.author = current_user.name
			else
				@story.author = "小編"
			end
		if @story.save
			respond_to do |format|
				  format.html { redirect_to admin_story_path(@story)}
				  format.js	
				  
			end		
		else 
			render :new
		end
	end

	def edit 
		a = @story.photofiles.count
		b = 5-a
		b.times {@photofiles = @story.photofiles.build}
	end

	def update
		if @story.update(story_params)		
			
			respond_to do |format|
				  format.html { redirect_to admin_story_path(@story)}
				  format.js
			end		
		else 
			render :edit
		end
	end


	def destroy 
		@story.destroy
		redirect_to admin_stories_path
	end


	protected

	def find_story
		@story = Story.find(params[:id])
	end

	def story_params
		params.require(:story).permit(:story_time,:title,:content,:reflection,
			                          :youtube_link,:is_public,:priority,:location,
			                          :need_project,
			                          :image, :tag_ids => [],
			                          :photofiles_attributes => [:id, :image, :_destroy]
			                          )
	end

	def check_admin
    unless current_user.role == "admin"
      raise ActiveRecord::RecordNotFound
    end      
  end

 

end
