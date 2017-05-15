class TagsController < ApplicationController
	def show 
		@tag = Tag.find(params[:id])
		@stories= @tag.stories.where(:is_public => true).order('created_at desc').page(params[:page]).per(9)
	end
end
