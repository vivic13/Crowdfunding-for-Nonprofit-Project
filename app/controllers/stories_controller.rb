class StoriesController < ApplicationController

	def index 
		@stories = Story.where(:is_public => true, :priority => true)+Story.where(:is_public => true, :priority => false) 
	end


	def show 
		@story = Story.find(params[:id])
	end





end
