class Account::StoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_story, only:[:show,:edit, :update, :destroy]

	def index 
		@page_title = "我的故事記錄"
		if current_user.role != "admin"
			@stories = Story.where(:author => current_user.name).page(params[:page]).per(8)
		else
			@stories = Story.where(:author => "小編").page(params[:page]).per(8)
		end
	end

	def show 
		@page_title = "故事內容"
		@photos = @story.photofiles
		@photos_count = @photos.count
		if @story.youtube_link.present?
			@link = "https://www.youtube.com/embed/" + @story.youtube_code + "?autoplay=0"
		end
	end

	def new
		@page_title = "新增故事"
		@story = @story = Story.new
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
					  format.html { redirect_to account_story_path(@story)}
					  format.js	
					  
				end		
			else 
				5.times {@photofiles = @story.photofiles.build}
				render :new
			end
	end

	def edit
		@page_title = "編輯故事" 
		a = @story.photofiles.count
		b = 5-a
		b.times {@photofiles = @story.photofiles.build}
	end

	def update
		if @story.update(story_params)		
			
			respond_to do |format|
				  format.html { redirect_to account_story_path(@story)}
				  format.js
			end		
		else 
			render :edit
		end
	end


	def destroy 
		@story.destroy
		redirect_to account_stories_path
	end


  def liked
  	@page_title = "我的按讚記錄"
  	@user = current_user
    @likes = Like.where(:user_id => current_user.id).page(params[:page]).per(8)
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





end
