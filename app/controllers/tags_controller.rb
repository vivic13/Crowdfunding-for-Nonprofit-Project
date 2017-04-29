class TagsController < ApplicationController
	def show 
		@tag = Tag.find(params[:id])
		@stories= @tag.stories.where(:is_public => true)
	end
end
