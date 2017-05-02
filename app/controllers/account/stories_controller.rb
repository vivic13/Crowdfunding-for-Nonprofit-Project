class Account::StoriesController < ApplicationController
	before_action :authenticate_user!

  def index
    @likes = Like.where(:user_id => current_user.id)
  end
end
