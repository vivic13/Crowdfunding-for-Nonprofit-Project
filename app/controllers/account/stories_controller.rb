class Account::StoriesController < ApplicationController
	layout "account"
	before_action :authenticate_user!
  

  def index
  	@user = current_user
    @likes = Like.where(:user_id => current_user.id)
  end
end
