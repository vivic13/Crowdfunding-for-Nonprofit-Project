class StoriesController < ApplicationController
	before_action :authenticate_user!, except:[:index,:show]
	before_action :find_story, except:[:index]
	
	def index 	
		@top_story =  Story.where(:is_public => true,:priority => true).first
		@stories =  Story.where(:is_public => true, :priority => false).order('created_at desc').page(params[:page]).per(8)

	end


	def show 
		@comment_no = @story.comments_count
		@comments = @story.comments.page(params[:page]).per(5)
		if @comments.last_page?
          @next_page = nil
        else
          @next_page = @comments.next_page
        end
        
		@photos = @story.photofiles
		@photos_count = @photos.count
		if @story.youtube_link.present?
			@link = "https://www.youtube.com/embed/" + @story.youtube_code + "?autoplay=0"
		end
	end

	def like 	
		unless @story.already_liked(current_user)
			@like = Like.create(:user => current_user, :story => @story)
			redirect_to :back
		end
	
	end

	def unlike
		if @story.already_liked(current_user)
			@like = @story.find_like(current_user)
			@like.destroy
			redirect_to :back
		end
	end

	private

	def find_story
		@story = Story.find(params[:id])
	end

end
