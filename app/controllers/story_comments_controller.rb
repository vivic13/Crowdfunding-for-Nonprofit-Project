class StoryCommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_story


	def create
		@comment=@story.comments.new(comment_params)
		if @comment.save
			respond_to do |format|
	        format.html { redirect_to story_path(@story)}
	        format.js	 # create.js.erb
    	  end
		else
			flash[:alert] = "請至少輸入ㄧ個字!"	
		end
	end


	def destroy
		
		@comment=@story.comments.find(params[:id])
		@comment.destroy
		if @comment.commenter == current_user.name  ||current_user.role == "admin"
		  
		  respond_to do |format|
	        format.html { redirect_to story_path(@story)}
	        format.js	 # destroy.js.erb
    	  end
			
		else
			flash[:alert] = "something went wrong!"	
		end

	end

	private

	def find_story
		@story=Story.find(params[:story_id])
	end

	def comment_params
		params.require(:comment).permit(:comment_body, :commenter, :image )
	end
end
