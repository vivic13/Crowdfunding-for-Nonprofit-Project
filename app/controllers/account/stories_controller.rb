class Account::StoriesController < ApplicationController
	before_action :authenticate_user!
  

  def index
  	@user = current_user
    @likes = Like.where(:user_id => current_user.id)
  end
end
